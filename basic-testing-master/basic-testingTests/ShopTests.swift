//
//  ShopTests.swift
//  basic-testingTests
//
//  Created by Eliel Gordon on 5/23/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import XCTest
@testable import basic_testing

class ShopTests: XCTestCase {
    var shop: Shop!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let apple = Product(id: 1, name: "Apple", price: 1.0)
        let orange = Product(id: 2, name: "Orange", price: 0.8)
        shop = Shop(products: [apple, orange],
                    cart: Cart(items: [], taxPercent: 8, couponCode: .none))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNumberOfProducts() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssert(shop.products.count == 2)
    }

    func testEmptyCartItems() {
        XCTAssert(shop.cart.numberOfItems() == 0)
    }
    
    func testAddItemsInCart() {
        let product_apple = shop.products[0]
        let apple = LineItem(id: 10, quantity: 10, price: product_apple.price, nama: product_apple.name)
        
        let product_orange = shop.products[1]
        let orange = LineItem(id: 11, quantity: 20, price: product_orange.price, nama: product_orange.name)
        
        shop.cart.add(items: apple, orange)
        XCTAssert(shop.cart.numberOfItems() == 2)
    }
}
