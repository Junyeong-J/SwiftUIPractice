//
//  UnderlineTextFieldView.swift
//  SwiftUIPracticeProject
//
//  Created by 전준영 on 9/2/24.
//

import SwiftUI

private struct UnderlineTextFieldView: ViewModifier {
    
    func body(content: Content) -> some View {
        VStack {
            content
                .padding(.leading, 8)
            
            Rectangle()
                .frame(height: 1)
                .asForeground(.gray)
        }
        .padding(.trailing, 16)
        
    }
}

extension View {
    func underlineTextFieldView() -> some View {
        self.modifier(UnderlineTextFieldView())
    }
}
