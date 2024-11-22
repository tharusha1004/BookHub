//
//  SelectedView.swift
//  BookHub
//
//  Created by mac on 2024-11-20.
//

import SwiftUI
import UserNotifications

struct SelectedView: View {
    
    var theBook: Book
    @State var showStory = false
    @State var showMap = false
    @StateObject var delegte = NotificationDelegate()
    
    var body: some View {
        
        CustomNavLink(title: theBook.title){
            ZStack{
                GeometryReader(content: { geometry in
                    Image(theBook.imageName).resizable().scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                })
                VStack(alignment: .leading, spacing: 24){
                    Text(theBook.title).font(.title).bold()
                        .foregroundColor(.white)
                    HStack{
                        Text("By John Simons")
                        line()
                        Text("Published December 20, 2024")
                    }
                    .foregroundStyle(.secondary)
                    HStack{
                        VStack(alignment: .leading, spacing: 15){
                            Text("READS").foregroundStyle(.secondary)
                            Text("2.8M").bold()
                        }
                        Spacer()
                        line()
                        Spacer()
                        VStack(alignment: .leading, spacing: 15){
                            Text("LIKES").foregroundStyle(.secondary)
                            Text("1.8M").bold()
                        }
                        Spacer()
                        line()
                        Spacer()
                        VStack(alignment: .leading, spacing: 15){
                            Text("PAGES").foregroundStyle(.secondary)
                            Text("52").bold()
                        }
                    }
                    Text("About \(theBook.title)").font(.title).bold()
                        .foregroundColor(.white)
                    Text(theBook.description)
                        .foregroundColor(.secondary)
                        .lineLimit(20)
                }
                .padding()
                .padding(.vertical, 20)
                .padding(.bottom, 60)
                .background(.ultraThinMaterial)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .overlay(alignment: .bottom) {
                    HStack {
                        // Start Reading Button on the left
                        Button(action: {
                            withAnimation {
                                showStory.toggle()
                            }
                        }, label: {
                            Text("Start Reading").bold()
                                .frame(width: 150, height: 50)
                                .background(.white, in: .capsule)
                                .foregroundStyle(.black)
                        })
                        
                        Spacer() // Space between the buttons
                        
                        // View Location Button on the right
                        Button(action: {
                            showMap.toggle()
                        }, label: {
                            Text("View Location")
                                .font(.headline)
                                .frame(width: 150, height: 50)
                                .background(.blue, in: .capsule)
                                .foregroundColor(.white)
                        })
                    }
                    .padding(.horizontal, 25) // Add padding to keep buttons away from screen edges
                    .padding(.bottom, 25)    // Bottom padding for alignment
                }
            }
            .overlay(
                // Download Now Button
                Button(action:{
                    createNotification()
                }, label: {
                    HStack{
                        Image(systemName: "icloud.and.arrow.down")
                            .font(.title2)
                        Text("Download Book")
                            .font(.headline)
                            .bold()
                    }
                    .padding(10)
                    .background(.ultraThinMaterial)
                    .clipShape(Capsule())
                    .shadow(radius: 5)
                    .frame(alignment: .topTrailing)
                })
                .onAppear(perform: {
                    UNUserNotificationCenter.current().requestAuthorization(options:
                        [.alert, .badge, .sound]) { (_, _) in
                    }
                    UNUserNotificationCenter.current().delegate = delegte
                })
            )
            .fullScreenCover(isPresented: $showStory, content: {
                StoryView(book: theBook)
            })
            .sheet(isPresented: $showMap){
                SearchableMap()
            }
            
            
        }action: {
            //
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SelectedView(theBook: Book(title: "bookname", imageName: "0_9", rating: 4.5, description: "description", story: ""))
}

struct line: View {
    var body: some View {
        Rectangle()
            .frame(width: 1, height: 35)
    }
}

// for in-app notifications
class NotificationDelegate: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .banner, .sound])
    }
}

func createNotification() {
    print("Creating notification...")
    let content = UNMutableNotificationContent()
    content.title = "Notification"
    content.subtitle = "Your Download is completed"
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
    let request = UNNotificationRequest(identifier: "IN-APP", content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(request) { error in
        if let error = error {
            print("Error adding notification: \(error.localizedDescription)")
        } else {
            print("Notification added successfully!")
        }
    }
}

// create notifications..

// getting access for notifications
