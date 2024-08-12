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
    private var orderButton = UIButton(type: .system)
    
    private var listOfPizzas = GlobalArray.shared.getArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        setupButton()
        updateOrderButtonTitle()
    }
    
    private func calculateTotalPrice() -> Double {
        let totalPrice = listOfPizzas.reduce(0.0) { (result, pizza) -> Double in
            return result + (Double(pizza.count) * pizza.price)
        }
        return totalPrice
    }
    
    private func updateOrderButtonTitle() {
        let totalPrice = calculateTotalPrice()
        orderButton.setTitle(" Оформить заказ на $\(Int(totalPrice)) ", for: .normal)
        view.layoutIfNeeded()
    }
    
    private func setupButton() {
        
        orderButton.setTitle("Оформить заказ на ", for: .normal)
        orderButton.tintColor = .white
        orderButton.backgroundColor = .systemGray
        orderButton.layer.cornerRadius = 10
        orderButton.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        orderButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(orderButton)
        
        NSLayoutConstraint.activate([
            orderButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            orderButton.widthAnchor.constraint(greaterThanOrEqualToConstant: orderButton.intrinsicContentSize.width + 16),
            orderButton.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
    }
}

extension OrderViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfPizzas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! OrderTableViewCell
        print("\(listOfPizzas[indexPath.row].count)")
        cell.titleLabel.text = listOfPizzas[indexPath.row].title
        cell.priceLabel.text = ("$\(listOfPizzas[indexPath.row].price)")
        cell.countLabel.text = "\(listOfPizzas[indexPath.row].count)"
        cell.plusButton.setTitle("+", for: .normal)
        cell.minusButton.setTitle("-", for: .normal)
        cell.minusButton.tag = indexPath.row
        cell.plusButton.tag = indexPath.row
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            
            self.listOfPizzas.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            updateOrderButtonTitle()
        }
    }
}

extension OrderViewController {
    override func viewWillAppear(_ animated: Bool) {
        listOfPizzas = GlobalArray.shared.getArray()
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateOrderButtonTitle()
    }
}

extension OrderViewController: TableViewCellCustomDelegate {
    func buttonTapped(index: Int, delta: Int) {
        listOfPizzas[index].count += delta
        if listOfPizzas[index].count < 0 {
            listOfPizzas[index].count = 0
        }
        updateOrderButtonTitle()
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .fade)
    }
    
    
}
