//
//  BasketElement.swift
//  mySpar
//
//  Created by Антон Разгуляев on 21.08.2024.
//

import SwiftUI

struct BasketElement: View {

    @EnvironmentObject var vm: ViewModel
    let imageName: String
    let name: String
    let price: Double
    let quantity: Double

    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 70)

            Text(name)
                .font(.footnote)
            Spacer()
            Divider()
            Text(String(format: "%.0f", quantity) + " шт")
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 100, height: 40)
                .foregroundStyle(.green)
                .overlay {
                    HStack (alignment: .top, spacing: 2) {
                        Text(String(format: "%.0f", price*quantity) + " ₽")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                    }
                    .bold()
                    .fontDesign(.rounded)
                }
        }
    }
}

#Preview {
    BasketElement(imageName: "Meat2", name: "сыр Ламбер 500/0 230 г", price: 199.90, quantity: 2)
        .environmentObject(ViewModel())
}
