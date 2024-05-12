//
//  PizzaModel.swift
//  PizzaApp
//
//  Created by Nurgali on 05.07.2023.
//

import Foundation

struct PizzaDetail: Decodable {
    let cheap, veryPopular: Bool
    let preparationMinutes: Int
    let pricePerServing: Double
    let id: Int
    let title: String
    let readyInMinutes: Int
    let sourceUrl: String
    let image: String
    let summary: String
    let cuisines, diets: [String]
}
