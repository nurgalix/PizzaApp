//
//  OrderViewController.swift
//  PizzaApp
//
//  Created by Nurgali on 08.07.2023.
//

import UIKit
import Combine

class OrderViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    private var listOfPizzas = GlobalArray.shared.getArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
//        listOfPizzas = GlobalArray.shared.getArray()
    }
}

extension OrderViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfPizzas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! OrderTableViewCell
        cell.title.text = listOfPizzas[indexPath.row].title
        return cell
    }
}

extension OrderViewController {
    override func viewWillAppear(_ animated: Bool) {
        listOfPizzas = GlobalArray.shared.getArray()
        tableView.reloadData()
        print("again")
    }
}
