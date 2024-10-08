//
//  ViewController.swift
//  PizzaApp
//
//  Created by Nurgali on 01.07.2023.
//

import UIKit

final class ViewController: UIViewController, UITabBarControllerDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    private var pizzaManager = PizzaManager()
    //    private var listOfPizzas: [Pizza] = []
    private var listOfPizzas: [Pizza] = pizzaMain.results
    private var pizzaDetail: PizzaDetail?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.delegate = self
        
        tableView.dataSource = self
        tableView.delegate = self
        
        pizzaManager.delegate = self
        //        pizzaManager.performRequest()
        
        navigationItem.title = "Pizza shop"
    }
    
}

extension ViewController: UITableViewDataSource, MyCellDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfPizzas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.delegate = self
        let pizza = listOfPizzas[indexPath.row]
        cell.setup(with: pizza)
        
        return cell
    }
    
    func btnTapped(cell: MyTableViewCell) {
        let indexPath = self.tableView.indexPath(for: cell)
        GlobalArray.shared.addArray(data: pizzasDetail[indexPath!.row])
//        GlobalArray.shared.changeCount(index: GlobalArray.shared.getArray().index)
        
        
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        pizzaDetail = pizzasDetail[indexPath.row]
        performSegue(withIdentifier: "segue", sender: cell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue" {
            let detailedViewController = segue.destination as! DetailedViewController
            detailedViewController.pizzaDetail = pizzaDetail
        }
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
        print(pizzas)
        tableView.reloadData()
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}
