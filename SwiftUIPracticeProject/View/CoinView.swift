//
//  CoinView.swift
//  SwiftUIPracticeProject
//
//  Created by 전준영 on 9/3/24.
//

import SwiftUI

struct CoinView: View {
    
    @State private var market: Markets = []
    @State private var searchText = ""
    
    @State private var isButtonClicked = false
    
    let color = Color(red: .random(in: 0...1),
                      green: .random(in: 0...1),
                      blue: .random(in: 0...1))
    
    private var filterMarket: Markets {
        guard !searchText.isEmpty else { return market }
        return market.filter { market in
            market.englishName.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                listView()
            }
            .navigationTitle("Search")
        }
        .task {
            UpbitAPI.fetchAllMarket { data in
                market = data
            }
        }
        .searchable(text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "search")
    }
    
    private func listView() -> some View {
        LazyVStack{
            ForEach(filterMarket, id: \.self){ item in
                rowView(item, isSeleted: isButtonClicked)
            }
        }
    }
    
    private func rowView(_ item: Market, isSeleted: Bool) -> some View {
        HStack{
            RandColorHeartView()
            VStack(alignment: .leading) {
                Text(item.englishName)
                    .fontWeight(.bold)
                Text(item.market)
                    .font(.caption)
            }
            Spacer()
            Button(action: {
                isButtonClicked.toggle()
            }, label: {
                Image(systemName: isButtonClicked ? "star" : "star.fill")
                    .asForeground(.black)
                    .font(.system(size: 20))
            })
            
            
        }
        .padding()
    }
    
}

#Preview {
    CoinView()
}

private struct RandColorHeartView: View {
    
    var body: some View {
        Circle()
            .fill(Color.random())
            .overlay {
                Image(systemName: "heart")
                    .asForeground(.white)
                    .font(.system(size: 25))
            }
            .frame(width: 50, height: 50)
    }
}

extension Color {
    static func random() -> Color {
        return Color(red: .random(in: 0...1),
                     green: .random(in: 0...1),
                     blue: .random(in: 0...1)
        )
    }
}
