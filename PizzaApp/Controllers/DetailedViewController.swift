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
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    
    var pizzaDetail: PizzaDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        
        setupScrollView()
        setupStackView()
        setupButton()
        
        
        if let pizzaDetail = pizzaDetail {
            navigationItem.title = pizzaDetail.title
            pizzaImage.image = UIImage(named: pizzaDetail.image)
            pizzaImage.layer.cornerRadius = 15
            summaryHeaderLabel.text = "Description"
            summaryLabel.text = pizzaDetail.summary
            summaryLabel.numberOfLines = 0
            cuisinesLabel.text = "\(pizzaDetail.cuisines.joined()) \n"
        } else {
            print("No pizza detail provided.")
            
        }
    }
    
    private func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(stackView)
        
        let contentLayoutGuide = scrollView.contentLayoutGuide
        
        NSLayoutConstraint.activate([
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor, constant: -8),
            stackView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupButton() {
        let button = UIButton(type: .system)
        button.setTitle("Order", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemGray
        button.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.addSubview(button)
        
        let contentLayoutGuide = scrollView.contentLayoutGuide
        let frameLayoutGuide = scrollView.frameLayoutGuide
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: frameLayoutGuide.centerXAnchor),
            button.widthAnchor.constraint(greaterThanOrEqualToConstant: button.intrinsicContentSize.width + 16),
            button.bottomAnchor.constraint(lessThanOrEqualTo: frameLayoutGuide.bottomAnchor, constant: -8)
        ])
    }
    
    @objc func pressed() {
        //MARK: - FORCE UNWRAPPING REMOVE then
        GlobalArray.shared.addArray(data: pizzaDetail!)
        tabBarController?.selectedIndex = 2
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
}
