//
//  CustomImageView.swift
//  SwiftUIPracticeProject
//
//  Created by 전준영 on 9/2/24.
//

import SwiftUI

struct CustomImageView: View {
    let imageName: String
    let width: CGFloat?
    let height: CGFloat?
    
    var body: some View {
        Image(imageName)
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height)
            .padding()
    }
}
