//
//  OrderViewController.swift
//  PizzaApp
//
//  Created by Nurgali on 08.07.2023.
//

import UIKit

class OrderViewController: UIViewController {
    
    let viewModel = ViewModel()
    
    @IBOutlet weak var arrayOrder: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Current Order"
        // Do any additional setup after loading the view.
        viewModel.observableArray.addObserver { [weak self] in
            // Update UI or perform any action when the array changes
            self?.updateUI()
        }
    }
    
    func updateUI() {
        // Update your UI based on the changes in the observable array
        let array = viewModel.observableArray.array
        arrayOrder.text = array[0]
        print(arrayOrder ?? "gg")
        // ...
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
