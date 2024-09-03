//
//  ProfileImageSettingView.swift
//  SwiftUIPracticeProject
//
//  Created by 전준영 on 9/2/24.
//

import SwiftUI

struct ProfileImageSettingView: View {
    
    @Binding var profileName: String
    
    let profileImageList: [String] = (0...11).compactMap {"profile_\($0)"}
    
    let columns = [
        GridItem(.flexible(), spacing: 40),
        GridItem(.flexible(), spacing: 40),
        GridItem(.flexible(), spacing: 40),
        GridItem(.flexible(), spacing: 40)
    ]
    
    var body: some View {
        NavigationView{
            VStack {
                Image(profileName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100, alignment: .leading)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.blue, lineWidth: 3)
                    }
                    .padding()
                
                LazyVGrid(columns: columns, spacing: 20){
                    ForEach(profileImageList, id: \.self) { profile in
                        Button(action: {
                            profileName = profile
                        }) {
                            Image(profile)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80, alignment: .leading)
                                .clipShape(Circle())
                                .opacity(profileName == profile ? 1 : 0.5)
                                .overlay {
                                    Circle()
                                        .stroke(profileName == profile ? .blue : .gray,
                                                lineWidth: profileName == profile ? 3 : 1)
                                }
                        }
                    }
                }
                .padding(.horizontal, 30)
                
                Spacer()
            }
            .navigationTitle("PROFILE SETTING")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
