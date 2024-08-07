//
//  GlobalArray.swift
//  PizzaApp
//
//  Created by Nurgali on 06.08.2024.
//

import Foundation

class GlobalArray {
    static let shared = GlobalArray()
    var globalArray : [PizzaDetail] = []
    private init() {}
    
    func getArray() -> [PizzaDetail] {
        return globalArray
    }
    
    func addArray(data: PizzaDetail) {
        globalArray.append(data)
    }
}
