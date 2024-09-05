//
//  HorizontalSectionView.swift
//  SwiftUIPracticeProject
//
//  Created by 전준영 on 9/5/24.
//

import SwiftUI

struct HorizontalSectionView: View {
    
    @Binding var text: String
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(0..<10) { item in
                    PosterView(text: $text)
                }
            }
        }
    }
}
