//
//  BasketView.swift
//  mySpar
//
//  Created by Антон Разгуляев on 21.08.2024.
//

import SwiftUI

struct BasketView: View {
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        List {
            ForEach(vm.productsInBasket) {product in
                BasketElement(imageName: product.image ?? "", name: product.name, price: product.price ?? 0, quantity: product.quantity ?? 0)
                    .frame(maxWidth: .infinity, maxHeight: 150)
                    .listRowSeparator(/*@START_MENU_TOKEN@*/.visible/*@END_MENU_TOKEN@*/)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    BasketView()
        .environmentObject(ViewModel())
}
