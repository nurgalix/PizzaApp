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
    
    private var list: [String] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
}

extension OrderViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! OrderTableViewCell
        cell.title.text = list[indexPath.row]
        return cell
    }
}
