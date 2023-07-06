//
//  PizzaData.swift
//  PizzaApp
//
//  Created by Nurgali on 05.07.2023.
//

import Foundation

struct PizzaResponse: Decodable {
    let results: [Pizza]
}

struct Pizza: Decodable {
    let readyInMinutes: Int
    let sourceUrl: String
    let image: String
    let servings: Int
    let id: Int
    let title: String
}
