//
//  ButtonBuy.swift
//  mySpar
//
//  Created by Антон Разгуляев on 20.08.2024.
//

import SwiftUI

struct ButtonBuy: View {
    @EnvironmentObject var vm: ViewModel
    @State var addedToBasket = false

    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(width: addedToBasket ? .infinity : 40, height: 30)
            .foregroundStyle(.green)
            .overlay {
                if addedToBasket {
                    HStack {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "minus")
                                .font(.title2)
                                .padding()
                        })
                        Spacer()
                        VStack {
                            Text("50 кг")
                                .font(.callout)
                                .fontDesign(.rounded)
                            Text("~5,92 ₽")
                                .font(.caption2)
                        }
                        Spacer()
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "plus")
                                .font(.title2)
                                .padding()
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
                    addedToBasket = true
                }

            }
    }
}

#Preview {
    ButtonBuy()
}
