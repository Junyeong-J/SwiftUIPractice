//
//  ImageDetailView.swift
//  SwiftUIPracticeProject
//
//  Created by 전준영 on 9/5/24.
//

import SwiftUI

struct ImageDetailView: View {
    
    var image: Image
    
    @Binding var text: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        image
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            .scaledToFit()
        
        TextField(":)", text: $text)
            .underlineTextFieldView()
            .padding()
            .onSubmit(of: .text) {
                print("user did tap return , \(text)")
                dismiss()
            }
        
    }
}
