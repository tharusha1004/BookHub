//
//  MostReadView.swift
//  BookHub
//
//  Created by mac on 2024-11-20.
//

import SwiftUI

struct MostReadView: View {
    
    var vm = DataManager.shared
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack{
                ForEach(vm.mostreadBook,id:\.title){ book in
                    NavigationLink{
                        SelectedView(theBook: book)
                    }label: {
                        MostRead(theBook: book)
                    }
                }
            }
        }
    }
    
    #Preview {
        HomeView()
    }
    
    struct MostRead: View {
        var theBook: Book
    
        var body: some View {
            Image(theBook.imageName).resizable().scaledToFill()
                .frame(width: 120, height: 160)
                .clipShape(.rect(cornerRadius: 12))
                .overlay(alignment: .topTrailing){
                    HStack(spacing:2){
                        Image(systemName: "star.fill").foregroundColor(.yellow)
                        Text("\(theBook.rating, specifier: "%.1f")")
                            .foregroundColor(.black)
                    }
                    .offset(x: -1)
                    .font(.system(size: 8))
                    .frame(width: 35, height: 15)
                    .background(.white,in: .rect(cornerRadius: 20))
                    .padding(6)
                }
        }
                
    }
}
