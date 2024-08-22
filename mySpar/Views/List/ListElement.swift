//
//  ListElement.swift
//  mySpar
//
//  Created by Антон Разгуляев on 21.08.2024.
//

import SwiftUI

struct ListElement: View {
    @EnvironmentObject var vm: ViewModel

    let imageName: String
    let rating: Double?
    let name: String
    let price: Double
    let oldPrice: Double?
    let madeIn: String?
    
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
                    TypePicker()
                        .padding(.vertical, 2)
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
                        ButtonBuy()
                    }
                }
            }
        }
    }
}

#Preview {
    ListElement(imageName: "Meat2", rating: nil, name: "сыр Ламбер 500/0 230 г", price: 199.90, oldPrice: 199, madeIn: nil)
}
