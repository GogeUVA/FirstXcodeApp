//
//  SwiftBasics.swift
//  FirstApp
//
//  Created by George Yao on 6/3/26.
//

import Playgrounds

#Playground {
    
    var canChange = "George"
    let cantChange = 100
    var message: String = "hello world"
    var number: Int = 10
    var year: Double = 20.26
    var colors: [String] = ["Red", "Blue", "Yellow"]
    colors.append("Purple")
    
    var user: [String: String] = [
        "key": "value",
        "key2": "value2"
    ]
    
    func greet() {
        print("Hello, World!")
    }
    
    greet()
    
    func calculateTotal(price: Double, quantity: Int) -> Double {
        return price * Double(quantity)
    }
    
    print(calculateTotal(price: 9.99, quantity: 3))
}
