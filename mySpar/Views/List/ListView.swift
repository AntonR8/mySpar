//
//  ListView.swift
//  mySpar
//
//  Created by Антон Разгуляев on 21.08.2024.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        List {
            ForEach(vm.products) {product in
                ListElement(id: product.id, imageName: product.image ?? "", madeIn: product.madeIn, comment: product.comment, name: product.name, rating: product.rating, oldPrice: product.oldPrice, price: product.price, discount: product.discount, isFavourite: product.isFavourite, quantity: product.quantity, measure: product.measure)
                    .frame(maxWidth: .infinity, maxHeight: 150)
                    .listRowSeparator(/*@START_MENU_TOKEN@*/.visible/*@END_MENU_TOKEN@*/)
//                    .listRowBackground(Color.white)
            }
        }
        .listStyle(.plain)
       
    }
}

#Preview {
    ListView()
        .environmentObject(ViewModel())
}
