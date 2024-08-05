//
//  PizzaManager.swift
//  PizzaApp
//
//  Created by Nurgali on 05.07.2023.
//

import Foundation

protocol PizzaManagerDelegate {
    func didFetchPizzas(_ pizzas: [Pizza])
    func didFailWithError(_ error: Error)
}

protocol DetailPizzaManagerDelegate {
    func didFetchPizza(_ pizza: PizzaDetail)
}

struct PizzaManager {
    private let pizzaURLString = "https://api.spoonacular.com/recipes/search?query=pizza&number=10&apiKey=e0852875d0d445aeb76895d158a4f54e"
    
    var delegate: PizzaManagerDelegate?
    var delegateDetail: DetailPizzaManagerDelegate?
    
    func performRequest() {
        guard let url = URL(string: pizzaURLString) else {
            // TODO: Make throwable
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            print(error)
            // TODO: Handle error
            
            if let data,
               let pizzas = self.parseJSON(from: data) {
                DispatchQueue.main.async {
                    self.delegate?.didFetchPizzas(pizzas)
                }
            }
        }.resume()
    }
    
    func parseJSON(from pizzaData: Data) -> [Pizza]? {
        let decoder = JSONDecoder()
        do {
            let pizzaResponse = try decoder.decode(PizzaResponse.self, from: pizzaData)
            let pizzas = pizzaResponse.results
            return pizzas
        } catch {
            // TODO: Handle error properly
            print(error)
            return nil
        }
    }
    
    func performRequest(for id: Int) {
        let pizzaDetailUrl = "https://api.spoonacular.com/recipes/" + String(id) + "/information?apiKey=e0852875d0d445aeb76895d158a4f54e"
        
        guard let url = URL(string: pizzaDetailUrl) else {
            // TODO: Make throwable
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            print(error ?? 1)
            // TODO: Handle error
            
            if let data,
               let pizza = self.detailParseJSON(from: data) {
                DispatchQueue.main.async {
                    self.delegateDetail?.didFetchPizza(pizza)
                }
            }
        }.resume()
    }
    
    func detailParseJSON(from pizzaData: Data) -> PizzaDetail? {
        let decoder = JSONDecoder()
        do {
            let pizzaDetail = try decoder.decode(PizzaDetail.self, from: pizzaData)
            return pizzaDetail
        } catch {
            // TODO: Handle error properly
            print(error)
            return nil
        }
    }
}
