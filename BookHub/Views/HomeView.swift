//
//  HomeView.swift
//  BookHub
//
//  Created by mac on 2024-11-18.
//

import SwiftUI

struct HomeView: View {
    
    @State private var selectedTab: Tab = .all
    var body: some View {
        NavigationStack {
            CustomNavView(title: "Hi Tharusha", profileImage: .pro){
                ScrollView{
                    VStack(spacing: 25){
                        MostReadView()
                        SegmentedControl(selectedTab: $selectedTab)
                        BookView(selectedTab: $selectedTab)
                    }
                    .safeAreaPadding(.horizontal, 16)
                    .safeAreaPadding(.top, 26)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}

