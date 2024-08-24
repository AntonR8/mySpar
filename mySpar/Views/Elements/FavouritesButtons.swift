//
//  FavouritesButtons.swift
//  mySpar
//
//  Created by АнтохаПрограммист on 24.08.2024.
//

import SwiftUI

///  Блок кнопок "Чек" и "Избранное" в правом верхнем углу
struct FavouritesButtons: View {
    @EnvironmentObject var vm: ViewModel
    var id: String
    var isFavourite: Bool
    
    var body: some View {
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
