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
                            GridElement(id: product.id, imageName: product.image ?? "", rating: product.rating, name: product.name, price: product.price, oldPrice: product.oldPrice, madeIn: product.madeIn, quantity: product.quantity, isFavourite: product.isFavoutite, comment: product.comment, measure: product.measure)
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
