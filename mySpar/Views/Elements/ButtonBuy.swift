//
//  ButtonBuy.swift
//  mySpar
//
//  Created by Антон Разгуляев on 20.08.2024.
//

/*
Свойства продукта, необхожимые для элемента:
 - id
 - новая цена
 - количество в корзине
 - в чем измеряется: шт или кг
 */

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
                        reduceQuantityButton
                        Spacer()
                        VStack {
                            Text(String(format: "%.0f", quantity ?? 0) + " \(measure)")
                                .font(.callout)
                                .fontDesign(.rounded)
                            Text("~" + String(format: "%.0f", (quantity ?? 0)*price) + " ₽")
                                .font(.caption2)
                        }
                        Spacer()
                        increaseQuantityButton
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


extension ButtonBuy {
    
    /// Кнопка минус в раскрывшемся отображении кнопки Корзина
    private var reduceQuantityButton: some View {
        Button(action: {
            if quantity ?? 0 > 0 {
                vm.changeQuantity(id: id, newQuantity: (quantity ?? 0) - 1.0)
            }
        }, label: {
            Image(systemName: "minus")
                .padding(.vertical)
                .padding(.leading)
        })
    }
    
    /// Кнопка плюс в раскрывшемся отображении кнопки Корзина
    private var increaseQuantityButton: some View {
        Button(action: {
            vm.changeQuantity(id: id, newQuantity: (quantity ?? 0) + 1.0)
        }, label: {
            Image(systemName: "plus")
                .padding(.vertical)
                .padding(.trailing)
        })
    }
}
