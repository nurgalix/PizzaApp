//
//  ViewController.swift
//  PizzaApp
//
//  Created by Nurgali on 01.07.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // Properties
    private var pizzaManager = PizzaManager()
    private var listOfPizzas: [Pizza] = []
    private var id: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        pizzaManager.delegate = self
        pizzaManager.performRequest()
        
        navigationItem.title = "Pizza shop"
    }
//
//    override func performSegue(withIdentifier identifier: String, sender: Any?) {
//        <#code#>
//    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfPizzas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        
        let pizza = listOfPizzas[indexPath.row]
        cell.setup(with: pizza)
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        id = self.listOfPizzas[indexPath.row].id
        performSegue(withIdentifier: "segue", sender: cell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // get a reference to the second view controller
        let detailedViewController = segue.destination as! DetailedViewController
        
        // set a variable in the second view controller with the data to pass
        detailedViewController.id = id
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}

extension ViewController: PizzaManagerDelegate {
    func didFetchPizzas(_ pizzas: [Pizza]) {
        self.listOfPizzas = pizzas
//        id =
        tableView.reloadData()
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}
