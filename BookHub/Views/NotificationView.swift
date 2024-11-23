///
/// NotificationView.swift
///  BookHub
///
/// Created by mac on 2024-11-20.
///

import SwiftUI

struct NotificationView: View{
    
    //MARK: Properties
    @State private var selectedTab: String = "All"
    
    //MARK: Initialize the Notifications
    @State private var notifications: [Notification] = [
        Notification(id: 1, title: "New Book Arrived", message: "New book arrived. Ready to read", time: "11:00 AM", isRead: false),
        Notification(id: 2, title: "New Feature Added", message: "Now you can get notes from each page", time: "07:42 PM", isRead: true),
        Notification(id: 3, title: "New Book Arrived", message: "New book arrived. Ready to read", time: "02:12 PM", isRead: false),
        Notification(id: 4, title: "New Book Arrived", message: "New book arrived. Ready to read", time: "09:47 AM", isRead: true),
        Notification(id: 5, title: "New Message", message: "New message from John Fernando", time: "05:00 PM", isRead: true),
        Notification(id: 6, title: "Membership Expired", message: "Your membership plan expired soon. Please Check", time: "08:18 PM", isRead: false),
        Notification(id: 7, title: "New Book Arrived", message: "New book arrived. Ready to read", time: "12:00 AM", isRead: true),
        Notification(id: 8, title: "New Message", message: "New message from Jagath Fernando", time: "04:38 AM", isRead: true)
    ]
    
    var body: some View{
        VStack(alignment: .leading){
            
            // Heading
            Text("Notifications")
            .font(.title)
            .fontWeight(.bold)
            .padding()
            
            // Picker Tabs
            Picker("Filter", selection: $selectedTab){
                Text("All").tag("All")
                Text("Read").tag("Read")
                Text("Unread").tag("Unread")
                Text("Important").tag("Important")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            
            // Notification List
            List(filteredNotifications){ notifications in
                HStack{
                    //Notification Details
                    VStack(alignment: .leading){
                        Text(notifications.title).font(.headline)
                        if !notifications.message.isEmpty{
                            Text(notifications.message).font(.subheadline).foregroundColor(.gray)
                        }
                        Text(notifications.time).font(.caption).foregroundColor(.secondary)
                    }
                    Spacer()
                    
                    //Button to toggle read / unread
                    Button(notifications.isRead ? "Mark as Read": "Mark as Read"){
                        toggleRead(notifications.id)
                    }
                    .font(.caption)
                    .padding(5)
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(5)
                    
                    // Button to Delete
                    Button(action:{ deleteNotification(notifications.id)}){
                        Image(systemName: "trash").foregroundStyle(.red)
                    }
                }
            }
            .listStyle(PlainListStyle())
        }
        .padding(.top)
    }
    
    // Filtered Notifications
    var filteredNotifications: [Notification] {
        if selectedTab == "Read" {
            return notifications.filter{$0.isRead}
        }else if selectedTab == "Unread" {
            return notifications.filter({$0.isRead == false})
        }
        return notifications
    }
    
    // Toggle Status
    func toggleRead(_ id: Int){
        if let index = notifications.firstIndex(where: {$0.id == id}){
            notifications[index].isRead.toggle()
        }
    }
    
    // Delete Status
    func deleteNotification(_ id: Int){
        notifications.removeAll(where: {$0.id == id})
    }
    
    //Notifications Model
    struct Notification: Identifiable{
        let id: Int
        let title: String
        let message: String
        let time: String
        var isRead: Bool
    }
}


#Preview {
    NotificationView()
}
