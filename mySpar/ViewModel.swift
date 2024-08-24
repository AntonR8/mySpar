//
//  ViewModel.swift
//  mySpar
//
//  Created by Антон Разгуляев on 20.08.2024.
//

import Foundation

class ViewModel: ObservableObject {
    
    /// Свойство, содержащее в себе массив из всех продуктов
    @Published var products: [Product] = []  {
        didSet {
            saveBasket()
        }
    }
    
    /// Свойство, содержащее в себе массив из продуктов, добавленных в корзину
    @Published var productsInBasket: [Product] = []
    
    init() {
        // создание продуктовой линейки:
        products = [
            Product(image: "Nuts", comment: "Удар по ценам", name: "сыр Ламбер 500/0 230г", price: 99.90, oldPrice: 199, measure: "шт"),
            Product(image: "Cola", name: "Энергетический Напиток", price: 99.90, oldPrice: 199, discount: 25, measure: "шт"),
            Product(image: "Meat2", comment: "Удар по ценам", name: "Салат Овощной с Крабовыми Палочками", price: 120.90, oldPrice: 219.5, measure: "шт"),
            Product(image: "Meat5", name: "Дорадо Охлажденная Непотрошеная 300-400г", price: 95699.25, oldPrice: 1298.90, measure: "шт"),
            Product(image: "Meat4", name: "Ролл Маленькая Япония 216 г", price: 299, oldPrice: 399, measure: "шт"),
            Product(image: "Cucumber", madeIn: "Франция 🇫🇷", name: "Огурцы тепличные cадово-огородные", price: 2600.90, oldPrice: 1999.90, measure: "шт"),
            Product(image: "Meat7", madeIn: "Турция 🇹🇷", name: "Манго Кео", price: 1298.90, oldPrice: 399, discount: 15, measure: "шт"),
            Product(image: "Meat8", name: "Салат Овощной с Крабовыми Палочками", price: 99.90, oldPrice: 299, measure: "шт"),
            Product(image: "Meat1", comment: "Новинка", name: "Масло Слобода Рафинированное 1,8л", price: 2600.90, oldPrice: 199, measure: "шт"),
            Product(image: "Cucumber", madeIn: "Италия 🇮🇹", name: "Макаронные Изделия SPAR Спагетти", price: 399, measure: "шт"),
            Product(image: "Nuts", name: "Огурцы тепличные cадово- огородные", price: 1298.90, oldPrice: 299, measure: "шт"),
            Product(image: "Tea", name: "Огурцы тепличные cадово- огородные", price: 2600.90, oldPrice: 199, measure: "шт")
        ]

        // извлечение из UserDefaults свойства products для сохранения информации о добавлении товаров в корзину,  то есть свойства количество
        guard
            let data = UserDefaults.standard.data(forKey: "encodedProducts"),
            let decodedProducts = try? JSONDecoder().decode([Product].self, from: data)
        else { return }
        self.products = decodedProducts
    }

    /// Функция добавления в избранное товара. Создает такой же товар с противоположным значением параметра isFavoutite
    func makeFavourite(id: String) {
        if let index = products.firstIndex(where: {$0.id == id}) {
            products[index] = products[index].addOrRemoveFromFavoutites()
        }
    }

    /// Функция изменения количества товара и добавления товара в корзину.
    func changeQuantity(id: String, newQuantity: Double) {
        if let index = products.firstIndex(where: {$0.id == id}) {
            products[index] = products[index].changeQuantity(newQuantity: newQuantity)
        }
        addToBasket()
    }

    /// Функция изменения размерности товара. Создана под segmenred picker
    func changeMeasure(id: String, newMeasure: String) {
        if let index = products.firstIndex(where: {$0.id == id}) {
            products[index] = products[index].changeMeasure(newMeasure: newMeasure)
        }
    }

    /// Функция добавления товара в корзину, то есть добавления продукта в массив productsInBasket. Отслеживает, чтобы товар не повторялся.
    func addToBasket() {
        var basket: [Product] = []
        for product in products {
            if product.quantity ?? 0 > 0 {
                basket.append(product)
            }
        }
        productsInBasket = basket
    }

    /// Функция расчета стоимости товаров в корзине
    func totalPrice() -> Double {
        var total: Double = 0
        for product in productsInBasket {
            if product.quantity ?? 0 > 0 {
                total += (product.price * (product.quantity ?? 0))
            }
        }
        return total
    }

    /// Функция сохранения свойства products в UserDefaults
    func saveBasket() {
        let encodedProducts = try? JSONEncoder().encode(products)
        UserDefaults.standard.setValue(encodedProducts, forKey: "encodedProducts")
    }

    /// Функция удаления товаров из корзины.
    func deleteFromBasket (indexSet: IndexSet) {
        productsInBasket.remove(atOffsets: indexSet)
    }

}
