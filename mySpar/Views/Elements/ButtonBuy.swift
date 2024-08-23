//
//  ButtonBuy.swift
//  mySpar
//
//  Created by Антон Разгуляев on 20.08.2024.
//

import SwiftUI

struct ButtonBuy: View {
    @EnvironmentObject var vm: ViewModel
    var quantity: Double?
    var id: String
    var price: Double
    var measure: String

    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(width: quantity != nil ? .infinity : 50, height: 40)
            .foregroundStyle(.green)
            .overlay {
                if quantity != nil {
                    HStack {
                        Button(action: {
                            if quantity ?? 0 > 0 {
                                vm.changeQuantity(id: id, newQuantity: (quantity ?? 0) - 1.0)
                            }
                        }, label: {
                            Image(systemName: "minus")
                                .padding(.vertical)
                                .padding(.leading)
                        })
                        Spacer()
                        VStack {
                            Text(String(format: "%.0f", quantity ?? 0) + " \(measure)")
                                .font(.callout)
                                .fontDesign(.rounded)
                            Text("~" + String(format: "%.0f", (quantity ?? 0)*price) + " ₽")
                                .font(.caption2)
                        }
                        Spacer()
                        Button(action: {
                            vm.changeQuantity(id: id, newQuantity: (quantity ?? 0) + 1.0)
                        }, label: {
                            Image(systemName: "plus")
                                .padding(.vertical)
                                .padding(.trailing)
                        })
                    }
                    .foregroundStyle(.white)
                    .bold()
                }
                else {
                    Image(systemName: "basket")
                        .font(.footnote)
                        .foregroundStyle(.white)
                        .bold()
                }
            }
            .onTapGesture {
                withAnimation(.bouncy) {
                    vm.changeQuantity(id: id, newQuantity: 1)
                }

            }
    }
}


