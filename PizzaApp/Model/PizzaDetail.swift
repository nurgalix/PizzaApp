//
//  PizzaDetail.swift
//  PizzaApp
//
//  Created by Nurgali on 05.07.2023.
//

import Foundation

struct PizzaDetail: Decodable {
    let cheap, veryPopular: Bool
    let preparationMinutes: Int
    let price: Double
    let title: String
    let image: String
    let summary: String
    let cuisines: [String]
}
