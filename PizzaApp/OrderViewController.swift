//
//  OrderViewController.swift
//  PizzaApp
//
//  Created by Nurgali on 08.07.2023.
//

import UIKit

class OrderViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var orderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Current Order"
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
