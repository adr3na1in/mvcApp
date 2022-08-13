//
//  File.swift
//  MVCapp
//
//  Created by Alex Ovi on 26.04.2022.
//


final class Model {
    private let goods = [
        Good(name: "apple", price: 10),
        Good(name: "orange", price: 50),
        Good(name: "tomato", price: 45),
        Good(name: "cucumber", price: 80),
        Good(name: "carrot", price: 20),
    ]
    
    func getGoods() -> [Good] {
        return self.goods
    }
    func getGoods(by name: String) -> [Good]{
        self.goods.filter { good in
            good.name.contains(name.lowercased())
        }
    }
}

struct Good {
    let name: String
    let price: Int
}


