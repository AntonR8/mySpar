//
//  PriceField.swift
//  mySpar
//
//  Created by АнтохаПрограммист on 24.08.2024.
//

import SwiftUI

///  Блок Цены
struct PriceField: View {
    @EnvironmentObject var vm: ViewModel
    let oldPrice: Double?
    let price: Double
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack (alignment: .top, spacing: 1) {
                Text(String(format: "%.0f", price)).font(.headline)
                Text(String(format: "%.0f", price.truncatingRemainder(dividingBy: Double(Int(price)))*100))
                    .font(.footnote)
                Text("₽/кг")
                    .font(.caption2)
                    .offset(y: 4)
            }
            .bold()
            .fontDesign(.rounded)
            Text(String(format: "%.1f", oldPrice ?? ""))
                .font(.caption)
                .strikethrough()
                .foregroundStyle(.gray)
        }
    }
}
