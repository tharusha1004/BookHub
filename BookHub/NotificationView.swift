//
//  NotificationView.swift
//  BookHub
//
//  Created by mac on 2024-11-20.
//

import SwiftUI

struct NotificationView: View {
    
    //View Properties
    @State private var searchText: String = ""
    
    
    // View
    var body: some View {
        ScrollView(.vertical){
            LazyVStack(spacing: 15){
                DummyMessageView()
            }
            .safeAreaPadding(15)
            .safeAreaInset(edge: .top, spacing: 0){
                ExpandableNavigation()
            }
        }
        .background(.gray.opacity(0.15))
    }
    
    //Expandable Navigation Bar
    @ViewBuilder
    func ExpandableNavigation(_ title: String = "Messages") -> some View{
        VStack(spacing:10){
            //Title
            Text(title)
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 10)
            
            //Search Bar
            HStack(spacing:12){
                Image(systemName: "magnifyingglass")
                    .font(.title3)
                
                TextField("Search for messages", text: $searchText)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 15)
            .frame(height: 45)
            .background{
                RoundedRectangle(cornerRadius: 25)
                    .fill(.background)
            }
        }
        .padding(.top, 25)
        .padding(.horizontal, 15)
        .padding(.bottom, 10)
    }
    
    // Dummy Message View
    @ViewBuilder
    func DummyMessageView() -> some View {
        ForEach(0..<20, id: \.self){ _ in
            HStack(spacing: 12){
                Circle()
                    .frame(width: 55, height: 55)
                
                VStack(alignment: .leading, spacing: 6, content: {
                    Rectangle()
                        .frame(width: 140, height: 8)
                    
                    Rectangle()
                        .frame(height: 8)
                    
                    Rectangle()
                        .frame(width:80, height: 8)
                })
            }
            .foregroundStyle(.gray.opacity(0.4))
            .padding(.horizontal, 15)
        }
    }
}

#Preview {
    NotificationView()
}
