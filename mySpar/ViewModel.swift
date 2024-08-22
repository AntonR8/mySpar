//
//  ViewModel.swift
//  mySpar
//
//  Created by Антон Разгуляев on 20.08.2024.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var productsInBasket: [Product] = []

    init() {
        products = [
            Product(image: "Nuts", comment: "Удар по ценам", name: "сыр Ламбер 500/0 230г", price: 99.90, oldPrice: 199),
            Product(image: "Cola", name: "Энергетический Напиток", price: 99.90, oldPrice: 199, discount: 25),
            Product(image: "Meat2", comment: "Удар по ценам", name: "Салат Овощной с Крабовыми Палочками", price: 120.90, oldPrice: 219.5),
            Product(image: "Meat5", name: "Дорадо Охлажденная Непотрошеная 300-400г", price: 95699.25, oldPrice: 1298.90),
            Product(image: "Meat4", name: "Ролл Маленькая Япония 216 г", price: 299, oldPrice: 399),
            Product(image: "Cucumber", madeIn: "Франция 🇫🇷", name: "Огурцы тепличные cадово-огородные", price: 2600.90, oldPrice: 1999.90),
            Product(image: "Meat7", madeIn: "Турция 🇹🇷", name: "Манго Кео", price: 1298.90, oldPrice: 399, discount: 15),
            Product(image: "Meat8", name: "Салат Овощной с Крабовыми Палочками", price: 99.90, oldPrice: 299),
            Product(image: "Meat1", comment: "Новинка", name: "Масло Слобода Рафинированное 1,8л", price: 2600.90, oldPrice: 199),
            Product(image: "Cucumber", madeIn: "Италия 🇮🇹", name: "Макаронные Изделия SPAR Спагетти", price: 399),
            Product(image: "Nuts", name: "Огурцы тепличные cадово- огородные", price: 1298.90, oldPrice: 299),
            Product(image: "Tea", name: "Огурцы тепличные cадово- огородные", price: 2600.90, oldPrice: 199)
        ]
    }

    func makeFavourite(id: String) {
        if let index = products.firstIndex(where: {$0.id == id}) {
            products[index] = products[index].addOrRemoveFromFavoutites()
        }
    }

}
