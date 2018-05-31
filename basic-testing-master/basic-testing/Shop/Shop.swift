//
//  Shop.swift
//  basic-testing
//
//  Created by Eliel Gordon on 5/23/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import Foundation

protocol ShopType {
    associatedtype Marchandise
    var products: [Marchandise] {get set}
    var cart: Cart {get set}
    
    func checkout()
}

enum CouponCode {
    case basic(discount: Int)
    case silver(discount: Int)
    case gold(discount: Int)
    case none
}

protocol Cartable {
    associatedtype Item
    var items: [Item] {get set}
    var taxPercent: Int {get set}
    var couponCode: CouponCode {get set}
    
    func checkout()
    // Total line items without tax
    func subTotal() -> Double
    // Total line items with tax minus discount
    func total() -> Double
    mutating func add(items: Item...)
    func numberOfItems() -> Int
    mutating func addCoupon(code: CouponCode) -> Bool
}

struct LineItem {
    // TODO: Fill me in
    // Should have id, quantity and price and name
    let id: Int
    var quantity: Int
    var price: Double
    let nama: String
    // TODO:
    // This is an empty implementation: fill it in
    // Total price of the item
    func total() -> Double {
        return price*Double(quantity)
    }
}


// TODO: Fill in. Product a shop can sell
// id, name, price
struct Product {
    let id: Int
    var name: String
    var price: Double
}

// TODO: Fill in implementation
struct Cart: Cartable {
    typealias Item = LineItem
    var items: [Item]
    var taxPercent: Int
    var couponCode: CouponCode
    
//    init(taxPercent: Int, couponCode: CouponCode) {
//        self.taxPercent = taxPercent
//        self.couponCode = couponCode
//    }
    
    func checkout() {
        print("checkout")
    }
    
    func subTotal() -> Double {
        var total: Double = 0.0
        for item in self.items {
            total += item.total()
        }
        return total
    }
    
    func total() -> Double {
        let subTotal = self.subTotal()
        var discountPercent: Int
        switch couponCode {
        case .basic(let discount), .silver(let discount), .gold(let discount):
            discountPercent = discount
        case .none:
            discountPercent = 0
        }
        return (subTotal*(1-Double(discountPercent)/100))*(1 + Double(taxPercent)/100)
    }
    
    mutating func add(items: LineItem...) {
        for item in items {
            self.items.append(item)
        }
    }
    
    func numberOfItems() -> Int {
        return self.items.count
    }
    
    mutating func addCoupon(code: CouponCode) -> Bool {
        self.couponCode = code
        return true
    }
}

struct Shop: ShopType {
    typealias Marchandise = Product
    var products: [Marchandise]
    var cart: Cart
    
    func checkout() {
        print("checkout")
    }
    
}

