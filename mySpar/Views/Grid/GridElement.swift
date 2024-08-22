//
//  GridElement.swift
//  mySpar
//
//  Created by Антон Разгуляев on 20.08.2024.
//

import SwiftUI

struct GridElement: View {
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

    @EnvironmentObject var vm: ViewModel

    var body: some View {
            VStack (alignment: .leading) {
                Image(imageName)
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
                
                if let quantity {
                    TypePicker()
                        .padding(.vertical, 2)

                    ButtonBuy()
                }
                else {
                    HStack {
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
                        Spacer()
                        Button(action: {
//                            vm.products.firstIndex(where: $0.id == id)


                        }, label: {
                            ButtonBuy()
                        })

                    }
                }

        }
            .padding(8)
            .overlay(
                VStack {
                    if let comment {
                        HStack {
                            RoundedRectangle(cornerRadius: 3)
                                .foregroundStyle(comment == "Новинка" ? .green : .red)
                                .frame(width: 100, height: 20)
                                .overlay {
                                    Text(comment)
                                        .font(.caption2)
                                        .foregroundStyle(.white)

                                }
                            Spacer()
                        }
                        Spacer()
                    }
                }
            )
            .clipShape(RoundedRectangle(cornerRadius: 25))
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
