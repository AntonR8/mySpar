//
//  ContentView.swift
//  mySpar
//
//  Created by Антон Разгуляев on 20.08.2024.
//

import SwiftUI

struct GridView: View {
    let myColumns = [
    GridItem(),
    GridItem()
    ]
    @EnvironmentObject var vm: ViewModel

    var body: some View {
        ScrollView{
            LazyVGrid (columns: myColumns) {
                ForEach(vm.products) {product in
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(height: 330)
                        .foregroundStyle(.white)
                        .shadow(radius: 10)
                        .overlay {
                            GridElement(id: product.id, imageName: product.image ?? "", madeIn: product.madeIn, comment: product.comment, name: product.name, rating: product.rating, oldPrice: product.oldPrice, price: product.price, discount: product.discount, isFavourite: product.isFavourite, quantity: product.quantity, measure: product.measure)
                                .frame(maxWidth: .infinity)
                        }


                }
            }

            .padding()

        }
        
        .ignoresSafeArea()
    }
}

#Preview {
    GridView()
        .environmentObject(ViewModel())
}
