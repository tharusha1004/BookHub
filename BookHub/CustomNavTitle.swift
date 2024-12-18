//
//  CustomNavTitle.swift
//  BookHub
//
//  Created by mac on 2024-11-20.
//

import SwiftUI

struct NavHeader: View {
    var scrollOffset: CGFloat
    var title: String
    var profileImage: ImageResource
    var body: some View {
        ZStack{
            
            HStack{
                NavigationLink(destination: NotificationView()) {
                    Image(systemName: "bell.badge").renderingMode(.template)
                        .resizable().scaledToFill()
                        .foregroundStyle(.black)
                        .frame(width: SideIcon(), height: SideIcon())
                }
                Spacer()
                Text(title).bold()
                    .font(.system(size: interpolatedOText()))
                    .offset(x: 10)
                Spacer()
                NavigationLink(destination: ProfileView()) { // Link to ProfileView
                    Image(profileImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: ProImage(), height: ProImage())
                        .cornerRadius(100)
                }
            }
            .offset(y:PushupOffset())
            .padding()
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
    
    private func interpolatedHeight() -> CGFloat {
        let startHeight: CGFloat = 60
        let endHeight: CGFloat = 30
        let transitionOffset: CGFloat = 35
        let progress = min(max(scrollOffset / transitionOffset, 0), 1)
        return endHeight + (startHeight - endHeight) * progress
    }
    
    private func SideIcon() -> CGFloat {
        let theend: CGFloat = 20
        let thestart: CGFloat = 15
        let transitionOffset: CGFloat = 35
        let progress = min(max(scrollOffset / transitionOffset, 0), 1)
        return thestart + (theend - thestart) * progress
    }
    
    private func ProImage() -> CGFloat {
        let theend: CGFloat = 40
        let thestart: CGFloat = 30
        let transitionOffset: CGFloat = 35
        let progress = min(max(scrollOffset / transitionOffset, 0), 1)
        return thestart + (theend - thestart) * progress
    }
    
    private func PushupOffset() -> CGFloat {
        let theend: CGFloat = -40
        let thestart: CGFloat = -30
        let transitionOffset: CGFloat = 50
        let progress = min(max(scrollOffset / transitionOffset, 0), 1)
        return thestart + (theend - thestart) * progress
    }
    
    private func interpolatedOText() -> CGFloat {
        let theendOffset: CGFloat = 20
        let thestartOffset: CGFloat = 25
        let transitionOffset: CGFloat = 50
        let progress = min(max(scrollOffset / transitionOffset, 0), 1)
        return theendOffset + (thestartOffset - theendOffset) * progress
    }
    
    private func opastyview() -> CGFloat {
        let startOffset: CGFloat = 0
        let endOffset: CGFloat = 1
        let transitionOffset: CGFloat = 60
        let progress = min(max(scrollOffset / transitionOffset, 0), 1)
        return endOffset + (startOffset - endOffset) * progress
    }
}

struct CustomNavView<Content: View>: View {
    var title: String
    var profileImage: ImageResource
    var content: Content
    
    @State private var scrollOffset: CGFloat = 0
    init(title: String, profileImage: ImageResource, @ViewBuilder content: () -> Content){
        self.title = title
        self.profileImage = profileImage
        self.content = content()
    }
    
    var body: some View {
        GeometryReader{ geo in
            ScrollView{
                ScrollOffsetBackground{ offset in
                    self.scrollOffset = offset - geo.safeAreaInsets.top
                }
                .frame(height: 0)
                content
            }
            .padding(.top,100)
            .ignoresSafeArea()
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 40)
            })
            .overlay{
                NavHeader(scrollOffset: scrollOffset, title: title, profileImage: profileImage)
            }
        }
    }
}

struct ScrollOffsetBackground: View{
    var onOffsetChange: (CGFloat) -> Void
    var body: some View{
        GeometryReader{ geometry in
            Color.clear
                .preference(key: ViewOffsetKey.self, value: geometry.frame(in: .global).minY)
                .onPreferenceChange(ViewOffsetKey.self, perform: onOffsetChange)
        }
    }
}

struct ViewOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }

}

//#Preview {
//    CustomNavTitle()
//}
