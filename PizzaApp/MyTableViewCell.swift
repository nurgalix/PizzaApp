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
    
    func setup(with pizzaDetails: PizzaDetails) {
        titleLabel.text = pizzaDetails.name
        descriptionLabel.text = pizzaDetails.description
        orderButton.titleLabel?.text = "$\(pizzaDetails.price)"
        pizzaImage.image = pizzaDetails.image
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


class Person {
    weak var pet: Pet?
}

class Pet {
    var owner: Person?
}


func referenceCycleExample() {
    let jPet = Pet()
    let mikePerson = Person()
    
    jPet.owner = mikePerson
    mikePerson.pet = jPet
}
