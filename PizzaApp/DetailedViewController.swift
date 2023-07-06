//
//  DetailedViewController.swift
//  PizzaApp
//
//  Created by Nurgali on 06.07.2023.
//

import UIKit

class DetailedViewController: UIViewController {
    
    @IBOutlet weak var someLabel: UILabel!
    
    var id: Int = 0
    private var pizzaManager = PizzaManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pizzaManager.delegateDetail = self
        pizzaManager.performRequest(for: id)
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

extension DetailedViewController: DetailPizzaManagerDelegate {
    func didFetchPizza(_ pizza: PizzaDetail) {
        self.someLabel.text = pizza.title
    }
}
