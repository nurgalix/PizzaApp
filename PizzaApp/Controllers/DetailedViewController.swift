//
//  DetailedViewController.swift
//  PizzaApp
//
//  Created by Nurgali on 06.07.2023.
//

import UIKit

class DetailedViewController: UIViewController {
    
    @IBOutlet weak var pizzaImage: UIImageView!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var summaryHeaderLabel: UILabel!
    @IBOutlet weak var cuisinesLabel: UILabel!
    
    var id: Int = 0
    var isTabBarHidden = false
    private var pizzaManager = PizzaManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tabBarController?.tabBar.isHidden = true
        pizzaManager.delegateDetail = self
        pizzaManager.performRequest(for: id)
        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
//        summaryLabel.addGestureRecognizer(tapGesture)
//        summaryLabel.isUserInteractionEnabled = true
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let selectedTitle = navigationItem.title {
            CartManager.shared.addPizza(with: selectedTitle)
        }
    }
    
    func presentNewViewController() {
        isTabBarHidden = true
        let viewControllerB = ViewController()
        present(viewControllerB, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tabBarController?.tabBar.isHidden = isTabBarHidden
    }
    
    // MARK: - TO FIX
//    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
//        let label = sender.view as! UILabel
//        // Update frame or constraints if needed
//        if label.numberOfLines == 3 {
//            label.numberOfLines = 0
//        } else {
//            label.numberOfLines = 3
//        }
//
//        // Update the layout to reflect the changed number of lines
//        label.superview?.layoutIfNeeded()
//    }

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
        print("111111111111111111111" + pizza.summary + "ASDASOIDJASOIDJASDASKJDALS:DJASDAAASD")
        summaryLabel.text = pizza.summary
        summaryLabel.numberOfLines = 0
        summaryHeaderLabel.text = "Summary"
        summaryHeaderLabel.font = .boldSystemFont(ofSize: 20)
        cuisinesLabel.text = pizza.cuisines[0]
//        if pizza.veryPopular == true {
//            popularityLabel.text = "Popular"
//        } else {
//            popularityLabel.text = "Shit"
//        }
        if let url = URL(string: pizza.image) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                // Error handling...
                guard data != nil else { return }
                DispatchQueue.main.async {
                    self.pizzaImage.image = UIImage(data: data!)
                }
            }.resume()
        }
        
        // MARK: - To solve long loading of title while segueing between views (does dispatch help?
        DispatchQueue.main.async {
            self.navigationItem.title = pizza.title
        }
    }
}
