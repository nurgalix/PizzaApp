//
//  ViewController.swift
//  PizzaApp
//
//  Created by Nurgali on 01.07.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    let listOfPizzas: [PizzaDetails] = [
        PizzaDetails(name: "macarella", description: "very tasty overall good choice for the first try", price: 500, image: UIImage(named: "images")!),
        PizzaDetails(name: "anapizza", description: "awful overall shit choice for the first try", price: 300, image: UIImage(named: "images-2")!),
        PizzaDetails(name: "dodo", description: "default tasty overall good choice for the first try", price: 450, image: UIImage(named: "images-3")!),
        PizzaDetails(name: "kfc", description: "piece of shit don't eat it", price: 60000000000000, image: UIImage(named: "images-4")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        navigationItem.title = "Pizza shop"
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfPizzas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        
        let pizzaDetails = listOfPizzas[indexPath.row]
        cell.setup(with: pizzaDetails)
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("You tapped me!")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
