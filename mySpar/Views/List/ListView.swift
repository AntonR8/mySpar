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
                ListElement(imageName: product.image ?? "", rating: product.rating, name: product.name, price: product.price ?? 0, oldPrice: product.oldPrice, madeIn: product.madeIn)
                    .frame(maxWidth: .infinity, maxHeight: 150)
                    .listRowSeparator(/*@START_MENU_TOKEN@*/.visible/*@END_MENU_TOKEN@*/)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    ListView()
        .environmentObject(ViewModel())
}
