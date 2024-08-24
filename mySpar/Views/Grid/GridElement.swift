//
//  GridElement.swift
//  mySpar
//
//  Created by Антон Разгуляев on 20.08.2024.
//

/*
 Свойства продукта, необхожимые для элемента::
 - id
 - изображение
 - страна изготовления (если есть)
 - комментарий акции (если есть)
 - наименование (если есть)
 - рейтинг (если есть)
 - старая цена (если есть)
 - новая цена
 - скидка (если есть)
 - добавлен ли в избранное
 - количество в корзине
 - в чем измеряется: шт или кг
 */

import SwiftUI

struct GridElement: View {
    let id: String
    let imageName: String
    let madeIn: String?
    let comment: String?
    let name: String
    let rating: Double?
    let oldPrice: Double?
    let price: Double
    var discount: Int?
    var isFavourite: Bool
    var quantity: Double?
    @State var measure: String
    
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        VStack (alignment: .leading) {
            Image(imageName)
                .resizable()
                .scaledToFit()
            HStack {
                Text("⭐️ \(String(format: "%.1f", rating ?? 5.0))")
                    .font(.caption)
                Spacer()
                Text("25%")
                    .foregroundStyle(.red)
                    .fontDesign(.rounded)
                    .bold()
            }
            Text(name)
                .font(.caption)
                .padding(.vertical, 2)
            Text(madeIn ?? "")
                .font(.caption2)
                .foregroundStyle(.gray)
            Spacer()
            if quantity != nil {
                TypePicker(id: id, selection: $measure)
                    .padding(.vertical, 2)
            }
            HStack {
                if quantity == nil {
                    PriceField(oldPrice: oldPrice, price: price)
                    Spacer()
                }
                ButtonBuy(quantity: quantity, id: id, price: price, measure: measure)
            }
        }
        .foregroundStyle(.black)
        .padding(8)
        .overlay(
            CommentLayer(comment: comment)
        )
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .overlay {
            FavouritesButtons(id: id, isFavourite: isFavourite)
        }
    }
}
