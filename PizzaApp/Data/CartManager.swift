//
//  CartManager.swift
//  PizzaApp
//
//  Created by Nurgali on 22.07.2023.
//

import Foundation
import Combine

final class CartManager {
    
    // MARK: - Singleton
    
    static let shared = CartManager()
    
    private init() {}
    
    // MARK: - Properties
    
    private(set) var orders: [String] = [] {
        didSet {
            ordersCurrentValueSubject.send(orders)
        }
    }
    
    // MARK: - Subjects
    
    private var ordersCurrentValueSubject = CurrentValueSubject<[String], Never>([])
    
    // MARK: - Publishers
    
    var ordersPublisher: AnyPublisher<[String], Never> {
        return ordersCurrentValueSubject.eraseToAnyPublisher()
    }
}

// MARK: - Add order

extension CartManager {
    
    func addPizza(with id: String) {
        orders.append(id)
    }
}
