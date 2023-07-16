//
//  ObservableArray.swift
//  PizzaApp
//
//  Created by Nurgali on 16.07.2023.
//

import Foundation

class ObservableArray<T> {
    var array: [T] = [] {
        didSet {
            notifyObservers()
        }
    }
    
    private var observers: [() -> Void] = []
    
    func addObserver(_ observer: @escaping () -> Void) {
        observers.append(observer)
    }
    
    private func notifyObservers() {
        observers.forEach { $0() }
    }
}

class ViewModel {
    let observableArray = ObservableArray<String>()
    
    func addItem(_ item: String) {
        observableArray.array.append(item)
    }
}
