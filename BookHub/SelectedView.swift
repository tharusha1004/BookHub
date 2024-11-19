//
//  SelectedView.swift
//  BookHub
//
//  Created by mac on 2024-11-20.
//

import SwiftUI

struct SelectedView: View {
    
    var theBook: Book
    @State var showStory = false
    
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
                .overlay(alignment: .bottom){
                    Button(action:{
                        withAnimation{
                            showStory.toggle()
                        }
                    }, label: {
                        Text("Start Reading").bold()
                            .frame(width: 250, height: 50)
                            .background(.white, in: .capsule)
                            .foregroundStyle(.black)
                    })
                    .padding(.bottom,25)
                }
            }
            .fullScreenCover(isPresented: $showStory, content: {
                StoryView(book: theBook)
            })
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
