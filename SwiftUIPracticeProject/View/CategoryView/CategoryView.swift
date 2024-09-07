//
//  CategoryView.swift
//  SwiftUIPracticeProject
//
//  Created by 전준영 on 9/5/24.
//

import SwiftUI

struct Categorys: Codable {
    var id = UUID()
    let name: String
    let count: Int
}

struct CategoryView: View {
    
    @State private var searchText: String = ""
    let item = ["SF", "가족", "스릴러"]
    @State private var list: [Categorys] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(list, id: \.id) { item in
                    HStack {
                        Image(systemName: "person")
                        Text("\(item.name)(\(item.count))")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                }
            }
                .navigationTitle("영화 검색")
                .toolbar {
                    Button("추가") {
                        list.append(Categorys(name: item.randomElement()!, count: .random(in:
                        1...100)))
                    }
                }
                .searchable(text: $searchText,
                            placement: .navigationBarDrawer(displayMode: .always),
                            prompt: "영화를 검색해 보세요")
        }
    }
}

#Preview {
    CategoryView()
}
