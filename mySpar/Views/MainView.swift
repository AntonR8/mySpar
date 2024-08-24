//
//  MainView.swift
//  mySpar
//
//  Created by Антон Разгуляев on 21.08.2024.
//

import SwiftUI

struct MainView: View {
    @State var selected = 1
    @State var gridSelected = true

    @EnvironmentObject var vm: ViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                withAnimation(.smooth) {
                    gridSelected.toggle()
                }
            }, label: {
                Image(systemName: gridSelected ? "circle.grid.2x2" : "chart.bar.doc.horizontal")
                    .foregroundStyle(.green)
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundStyle(.gray.opacity(0.2))
                    )
            })
            .padding(.horizontal)
            TabView(selection: $selected,
                    content: {
                Group {
                    if gridSelected {
                        GridView()
                    } else {
                        ListView()
                    }
                }
                    .tabItem {
                        Image(systemName: "doc.text.magnifyingglass")
                        Text("Товары")
                    }
                    .tag(1)
                BasketView()
                    .tabItem {
                        Text("Корзина")
                        Image(systemName: "basket.fill")
                    }
                    .tag(2)
                    .badge(vm.productsInBasket.count)
            })
        }
    }
}

#Preview {
    MainView()
        .environmentObject(ViewModel())
}
