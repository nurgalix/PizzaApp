//
//  PizzaManager.swift
//  PizzaApp
//
//  Created by Nurgali on 05.07.2023.
//

import Foundation

protocol PizzaManagerDelegate {
    func didFetchPizzas(_ pizzas: [Pizza], _ detailedPizzas: [PizzaDetail])
    func didFailWithError(_ error: Error)
}

protocol DetailPizzaManagerDelegate {
    func didFetchPizza(_ pizza: PizzaDetail)
}

class PizzaManager {
    private let pizzaURLString = "https://api.spoonacular.com/recipes/search?query=pizza&number=10&apiKey=e0852875d0d445aeb76895d158a4f54e"
    
    var delegate: PizzaManagerDelegate?
    var delegateDetail: DetailPizzaManagerDelegate?
    
    private var detailedPizzas: [PizzaDetail] = []
    
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
                
                let group = DispatchGroup()
                        
                for i in pizzas {
                    group.enter()
                    self.performRequest(for: i.id) { [self] pizzaDetail in
                        if let pizzaDetail = pizzaDetail {
                            print(pizzaDetail)
                            detailedPizzas.append(pizzaDetail)
                        }
                        group.leave()
                    }
                }
                
                group.notify(queue: .main) {
                               
                }
                
                DispatchQueue.main.async { [self] in
                    self.delegate?.didFetchPizzas(pizzas, detailedPizzas)
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
    
    
    
    func performRequest(for id: Int, completion: @escaping (PizzaDetail?) -> Void) {
        var pizzaDetailUrl = "https://api.spoonacular.com/recipes/" + String(id) + "/information?apiKey=e0852875d0d445aeb76895d158a4f54e"
        
        guard let url = URL(string: pizzaDetailUrl) else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            print(error ?? 1)
            // TODO: Handle error
            
            if let data, let pizzaDetail = self.detailParseJSON(from: data) {
               completion(pizzaDetail)
            } else {
                completion(nil)
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
