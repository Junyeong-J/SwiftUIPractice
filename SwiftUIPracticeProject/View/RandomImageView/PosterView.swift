//
//  PosterView.swift
//  SwiftUIPracticeProject
//
//  Created by 전준영 on 9/5/24.
//

import SwiftUI

struct PosterView: View {
    
    @Binding var text: String
    
    let url = URL(string: "https://picsum.photos/125/175")
    
    var body: some View {
        AsyncImage(url: url) { data in
            switch data {
            case .empty:
                ProgressView()
                    .frame(width: 125, height: 175)
            case .success(let image):
                NavigationLink {
                    ImageDetailView(image: image, text: $text)
                } label: {
                    image
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        .scaledToFit()
                }
            case .failure(_):
                Image(systemName: "star")
            @unknown default:
                Image(systemName: "star")
            }
            
        }
    }
}
//
//struct ImageDetailView: View {
//    
//    var image: Image
//    
//    @Binding var text: String
//    @Environment(\.dismiss) var dismiss
//    
//    var body: some View {
//        
//        image
//            .clipShape(RoundedRectangle(cornerRadius: 25.0))
//            .scaledToFit()
//        
//        TextField("닉네임을 입력해주세요 :)", text: $text)
//            .underlineTextFieldView()
//            .padding()
//            .onSubmit(of: .text) {
//                print("user did tap return , \(text)")
//                text = text
//                dismiss()
//            }
//        
//    }
//}
