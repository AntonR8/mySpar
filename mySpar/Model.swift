//
//  Product.swift
//  mySpar
//
//  Created by Антон Разгуляев on 20.08.2024.
//

/*
 Продукт:
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

import Foundation


struct Product: Identifiable, Equatable, Codable {
    var id: String
    let image: String?
    let madeIn: String?
    let comment: String?
    let name: String
    var rating, oldPrice: Double?
    var price: Double
    var discount: Int?
    var isFavourite: Bool
    var quantity: Double?
    var measure: String

    init(image: String?, madeIn: String? = nil, comment: String? = nil, name: String, rating: Double? = nil, price: Double, oldPrice: Double? = nil, discount: Int? = nil ,isFavourite: Bool = false, quantity: Double? = nil, measure: String) {
        self.id = UUID().uuidString
        self.image = image
        self.madeIn = madeIn
        self.comment = comment
        self.name = name
        self.rating = rating
        self.price = price
        self.oldPrice = oldPrice
        self.discount = discount
        self.isFavourite = isFavourite
        self.quantity = quantity
        self.measure = measure
    }

    /// Функция добавления и удаления из избранных. Меняет значение свойства isFavoutite на противоположное
    func addOrRemoveFromFavoutites() -> Product {
        Product(image: image, madeIn: madeIn, comment: comment, name: name, rating: rating, price: price, oldPrice: oldPrice, discount: discount, isFavourite: !isFavourite, quantity: quantity, measure: measure)
    }

    /// Функция изменения количества товара. Принимает на вход новое значение и устанавливает его для свойства quantity
    func changeQuantity(newQuantity: Double)  -> Product {
        Product(image: image, madeIn: madeIn, comment: comment, name: name, rating: rating, price: price, oldPrice: oldPrice, discount: discount, isFavourite: isFavourite, quantity: newQuantity, measure: measure)
    }

    /// Функция изменения размерности товара. Принимает на вход новое значение и устанавливает его для свойства measure
    func changeMeasure(newMeasure: String)  -> Product {
        Product(image: image, madeIn: madeIn, comment: comment, name: name, rating: rating, price: price, oldPrice: oldPrice, discount: discount, isFavourite: isFavourite, quantity: quantity, measure: newMeasure)
    }
}
