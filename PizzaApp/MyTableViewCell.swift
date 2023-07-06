//
//  MyTableViewCell.swift
//  PizzaApp
//
//  Created by Nurgali on 01.07.2023.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var orderButton: UIButton!
    @IBOutlet private weak var pizzaImage: UIImageView!
    
//    private var id: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        pizzaImage.layer.cornerRadius = pizzaImage.frame.width / 2
        pizzaImage.layer.borderWidth = 1
        pizzaImage.layer.borderColor = UIColor.systemGray5.cgColor
        pizzaImage.layer.masksToBounds = true
    }
    
    // MARK: - Configure
    
    func setup(with pizza: Pizza) {
        titleLabel.text = pizza.title
        descriptionLabel.text = "No data"
        orderButton.titleLabel?.text = "No price"
        pizzaImage.image = UIImage.checkmark
//        id = pizza.id
        let imageUrl = "https://spoonacular.com/recipeImages/" + pizza.image
//        let data = try? Data(contentsOf: url!)
        if let url = URL(string: imageUrl) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                // Error handling...
                guard data != nil else { return }
                
                DispatchQueue.main.async {
                    self.pizzaImage.image = UIImage(data: data!)
                }
            }.resume()
        }
    }
    
    // MARK: - Private
    
    private func setupUI() {
        orderButton.layer.borderColor = UIColor.red.cgColor
        orderButton.layer.borderWidth = 1.5
        orderButton.layer.cornerRadius = 10.0
        orderButton.layer.masksToBounds = true
        
        setupSeparator()
    }
    
    private func setupSeparator() {
        preservesSuperviewLayoutMargins = false
        separatorInset = .zero
        layoutMargins = .zero
    }
}
