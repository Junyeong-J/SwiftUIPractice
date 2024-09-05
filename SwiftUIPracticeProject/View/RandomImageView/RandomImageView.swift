//
//  RandomImageView.swift
//  SwiftUIPracticeProject
//
//  Created by 전준영 on 9/5/24.
//

import SwiftUI

struct Sect: Codable {
    var id = UUID()
    var section: String
}

struct RandomImageView: View {
    
    @State private var text: String = ""
    
    @State private var list: [Sect] = [
        Sect(section: "첫번째 섹션"),
        Sect(section: "두번째 섹션"),
        Sect(section: "세번째 섹션"),
        Sect(section: "네번째 섹션")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach($list, id: \.id) { $item in
                    makeSection($item)
                }
            }
            .navigationTitle("My Random Image")
        }
    
    }
    
    func makeSection(_ section: Binding<Sect>) -> some View {
        VStack {
            Text(section.section.wrappedValue)
                .font(.title2)
                .bold()
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            HorizontalSectionView(text: section.section)
        }
    }
    
}

#Preview {
    RandomImageView()
}
