//
//  ShopTests.swift
//  basic-testingTests
//
//  Created by Eliel Gordon on 5/23/18.
//  Copyright © 2018 MakeSchool. All rights reserved.
//

import XCTest
@testable import basic_testing

class CartTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // TODO: Test creating empty shopping cart
    func testCreateEmptyShoppingCart() {
        let cart = Cart(items: [], taxPercent: 8, couponCode: .basic(discount: 5))
        XCTAssert(cart.numberOfItems() == 0)
    }
    
    // TODO: Test Creating line items have the correct total 
    func testLineItemTotal() {
        let apple = LineItem(id: 1, quantity: 100, price: 1, nama: "Apple")
        XCTAssert(apple.total() == 100)
    }
    
    // TODO:
    // Test Adding items to cart works
    // Test that the number of items in cart equal the number of line items inserted
    func testCartAddingItemsToCart() {
        var cart = Cart(items: [], taxPercent: 8, couponCode: .basic(discount: 5))
        let apple = LineItem(id: 1, quantity: 100, price: 1, nama: "Apple")
        let orange = LineItem(id: 2, quantity: 80, price: 0.8, nama: "Orange")
        cart.add(items: apple, orange)
        XCTAssert(cart.numberOfItems() == 2)
    }
    
    // TODO: Create line items and tests that total is equal to the number of lineitems multiplied by their respective quantities
    func testCartTotalWithItems() {
        var cart = Cart(items: [], taxPercent: 8, couponCode: .basic(discount: 5))
        let apple = LineItem(id: 1, quantity: 100, price: 1, nama: "Apple")
        let orange = LineItem(id: 2, quantity: 80, price: 0.8, nama: "Orange")
        cart.add(items: apple, orange)
        let subtotal = (Double(apple.quantity)*apple.price)
                       + (Double(orange.quantity)*orange.price) // 164.0
        XCTAssert(cart.subTotal() == subtotal)
    }
    
    // TODO: Test cart total will be equal to line items * quantity + tax - coupon code
    func testCartTotalWithCouponAndTax() {
        var cart = Cart(items: [], taxPercent: 8, couponCode: .basic(discount: 5))
        let apple = LineItem(id: 1, quantity: 100, price: 1, nama: "Apple")
        let orange = LineItem(id: 2, quantity: 80, price: 0.8, nama: "Orange")
        cart.add(items: apple, orange)
        let subtotal = (Double(apple.quantity)*apple.price)
                       + (Double(orange.quantity)*orange.price) // 164.0
        let total = (subtotal*(1-5/100))*(1+8/100) // 168.264
        XCTAssert(cart.total() == total)
    }
    
    // TODO: Test cart total will be equal to line items * quantity + tax
    func testCartTotalWithJustTax() {
        var cart = Cart(items: [], taxPercent: 8, couponCode: .none)
        let apple = LineItem(id: 1, quantity: 100, price: 1, nama: "Apple")
        let orange = LineItem(id: 2, quantity: 80, price: 0.8, nama: "Orange")
        cart.add(items: apple, orange)
        XCTAssert(cart.total() == 177.12)
    }
}
