//
//  ListElement.swift
//  mySpar
//
//  Created by Антон Разгуляев on 21.08.2024.
//

import SwiftUI

struct ListElement: View {
    @EnvironmentObject var vm: ViewModel

    let id: String
    let imageName: String
    let rating: Double?
    let name: String
    let price: Double
    let oldPrice: Double?
    let madeIn: String?
    var quantity: Double?
    var isFavourite: Bool
    let comment: String?
    var discount: Int?
    @State var measure: String

    var body: some View {
        HStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit() 
                    .frame(width: UIScreen.main.bounds.width/2 - 64)
            ZStack {
                VStack(alignment: .leading) {
                    Text("⭐️ \(String(format: "%.1f", rating ?? 5.0))" )
                        .font(.caption) + Text(" | ") + Text("19 отзывов").font(.caption).foregroundColor(.gray)
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
                            VStack (alignment: .leading) {
                                HStack (alignment: .top, spacing: 2) {
                                    Text(String(format: "%.0f", price)).font(.headline)
                                    Text(String(format: "%.0f", price.truncatingRemainder(dividingBy: Double(Int(price)))*100) + " ₽/кг")
                                        .font(.subheadline)
                                }
                                .bold()
                                .fontDesign(.rounded)
                                Text(String(format: "%.1f", oldPrice ?? ""))
                                    .font(.caption)
                                    .strikethrough()
                                    .foregroundStyle(.gray)
                            }
                        }
                        Spacer()
                        ButtonBuy(quantity: quantity, id: id, price: price, measure: measure)
                    }
                }
            }
        }
        .overlay(
            VStack {
                if let comment {
                    HStack {
                        RoundedRectangle(cornerRadius: 3)
                            .foregroundStyle(comment == "Новинка" ? .green : .red)
                            .frame(width: 110, height: 20)
                            .overlay {
                                Text(comment)
                                    .font(.caption2)
                                    .foregroundStyle(.white)

                            }
                        Spacer()
                    }
                    Spacer()
                }
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
            VStack {
                HStack {
                    Spacer()
                    VStack {
                        Image(systemName: "doc.text")
                            .padding(.bottom, 10)
                            .foregroundColor(.gray)
                        Button(action: {
                            vm.makeFavourite(id: id)
                        }, label: {
                            Image(systemName: isFavourite ? "heart.fill" : "heart")
                                .foregroundColor(isFavourite ? .red : .gray)
                        })
                        .font(.footnote)

                    }
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.white.opacity(0.7))
                )
                }
                Spacer()
            }
            .padding(6)
        }
    }
}
