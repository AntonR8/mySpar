//
//  ListElement.swift
//  mySpar
//
//  Created by Антон Разгуляев on 21.08.2024.
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

struct ListElement: View {
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
        HStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit() 
                    .frame(width: UIScreen.main.bounds.width/2 - 64)
                VStack(alignment: .leading) {
                    Text("⭐️ \(String(format: "%.1f", rating ?? 5.0))" )
                        .font(.caption).foregroundStyle(.black) + Text(" | ").foregroundStyle(.black) + Text("19 отзывов").font(.caption).foregroundColor(.gray)
                    Text(name)
                        .font(.caption)
                        .padding(.vertical, 2)
                        .foregroundStyle(.black)
                    Text(madeIn ?? "")
                        .font(.caption2)
                        .foregroundStyle(.gray)
                        .foregroundStyle(.black)
                    Spacer()
                    if quantity != nil {
                        TypePicker(id: id, selection: $measure)
                            .padding(2)
                    }
                    HStack {
                        if quantity == nil {
                           PriceField(oldPrice: oldPrice, price: price)
                        }
                        Spacer()
                        ButtonBuy(quantity: quantity, id: id, price: price, measure: measure)
                    }
            }
        }
        .background(.white)
        .overlay(
            VStack {
                CommentLayer(comment: comment)
                Spacer()
                Text("25%")
                    .foregroundStyle(.red)
                    .fontDesign(.rounded)
                    .bold()
                    .offset(x: (64 + 64 - UIScreen.main.bounds.width/2))
            }
        )
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .overlay {
            FavouritesButtons(id: id, isFavourite: isFavourite)
        }
    }
}

