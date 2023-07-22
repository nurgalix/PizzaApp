//
//  AppState.swift
//  PizzaApp
//
//  Created by Nurgali on 22.07.2023.
//

import Foundation
import Combine

final class CartManager {
    
    // MARK: - Singleton
    
    let shared = CartManager()
    
    private init() {}
    
    // MARK: - Subject
    
    private var ordersCurrentValueSubject = CurrentValueSubject<[String], Never>([])
}

// MARK: - Add order

extension CartManager {
    
    func addPizza(with id: String) {
        let finalOrders = ordersCurrentValueSubject.value + [id]
        ordersCurrentValueSubject.send(finalOrders)
    }
}
