//
//  RadiusBlueBackground.swift
//  SwiftUIPracticeProject
//
//  Created by 전준영 on 9/2/24.
//

import SwiftUI

private struct RadiusBlueBackground: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .asForeground(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(.blue)
            .clipShape(.capsule)
    }
    
}

extension View {
    
    func asRadiusBlueBackground() -> some View {
        modifier(RadiusBlueBackground())
    }
    
}
