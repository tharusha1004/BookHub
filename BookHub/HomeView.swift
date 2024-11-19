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
            ScrollView{
                VStack{
                    MostReadView()
                    SegmentedControl(selectedTab: $selectedTab)
                    BookView(selectedTab: $selectedTab)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}

