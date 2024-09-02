//
//  NavigationLinkCustomButton.swift
//  SwiftUIPracticeProject
//
//  Created by 전준영 on 9/2/24.
//

import SwiftUI

struct NavigationLinkCustomButton<Destination: View>: View {
    let title: String
    let destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(title)
                .asRadiusBlueBackground()
        }
        .padding(.horizontal, 10)
    }
}
