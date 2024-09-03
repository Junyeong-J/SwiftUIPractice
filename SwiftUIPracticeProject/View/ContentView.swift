//
//  ContentView.swift
//  SwiftUIPracticeProject
//
//  Created by 전준영 on 9/2/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack {
                CustomImageView(imageName: ImageName.AppTitleImage.rawValue,
                                width: 200,
                                height: 200)
                
                CustomImageView(imageName: ImageName.AppMainPoster.rawValue,
                                width: nil,
                                height: nil)
                Spacer()
                NavigationLinkCustomButton(title: "시작하기", destination: ProfileSettingView())
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
