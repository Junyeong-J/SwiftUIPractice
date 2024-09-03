//
//  ProfileSettingView.swift
//  SwiftUIPracticeProject
//
//  Created by 전준영 on 9/2/24.
//

import SwiftUI

struct ProfileSettingView: View {
    
    @State private var text: String = ""
    @State private var profileImageRandom: String = "profile_\(Int.random(in: 0...11))"
    @State private var isSheetPresented = false
    
    let mbtiList = ["E", "S", "T", "J", "I", "N", "F", "P"]
    let columns = [
        GridItem(.flexible(), spacing: 50),
        GridItem(.flexible(), spacing: 50),
        GridItem(.flexible(), spacing: 50),
        GridItem(.flexible(), spacing: 50)
    ]
    var body: some View {
        NavigationView{
            VStack {
                NavigationLink(destination: ProfileImageSettingView(profileName: $profileImageRandom)) {
                    Image(profileImageRandom)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100, alignment: .leading)
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.blue, lineWidth: 3)
                        }
                }
                TextField("닉네임을 입력해주세요 :)", text: $text)
                    .underlineTextFieldView()
                    .padding()
                HStack {
                    Text("MBTI")
                        .font(.title3)
                        .bold()
                        .padding()
                    Spacer()
                    LazyVGrid(columns: columns, spacing: 20){
                        ForEach(mbtiList, id: \.self) { mbti in
                            Button(action: {
                            }) {
                                Circle().stroke(.gray, lineWidth: 2)
                                    .frame(width: 50, height: 50)
                                    .asForeground(.white)
                                    .overlay(
                                        Text(mbti)
                                            .asForeground(.gray)
                                    )
                            }
                        }
                        
                    }
                    .padding(.horizontal, 20)
                }
                Spacer()
                Button(action: {
                    isSheetPresented = true
                }) {
                    Text("완료")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .asForeground(.white)
                        .cornerRadius(25)
                }
                .padding()
                .sheet(isPresented: $isSheetPresented) {
                    MainView()
                }
            }
            .padding()
            .navigationTitle("PROFILE SETTING")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProfileSettingView()
}
