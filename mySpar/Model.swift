//
//  Product.swift
//  mySpar
//
//  Created by Антон Разгуляев on 20.08.2024.
//

import Foundation

struct Product: Identifiable {
    var id: String
    let image: String?
    let madeIn: String?
    let comment: String?
    let name: String
    var rating, price, oldPrice: Double?
    var discount: Int?
    var isFavoutite: Bool
    var quantity: Double?

    init(image: String?, madeIn: String? = nil, comment: String? = nil, name: String, rating: Double? = nil, price: Double? = nil, oldPrice: Double? = nil, discount: Int? = nil ,isFavoutite: Bool = false, quantity: Double? = nil) {
        self.id = UUID().uuidString
        self.image = image
        self.madeIn = madeIn
        self.comment = comment
        self.name = name
        self.rating = rating
        self.price = price
        self.oldPrice = oldPrice
        self.discount = discount
        self.isFavoutite = isFavoutite
        self.quantity = quantity
    }

    func addOrRemoveFromFavoutites() -> Product {
        Product(image: image, madeIn: madeIn, comment: comment, name: name, rating: rating, price: price, oldPrice: oldPrice, discount: discount, isFavoutite: !isFavoutite, quantity: quantity)
    }

    mutating func changeQuantity(newQuantity: Double) {
        self.quantity = newQuantity
    }
}
