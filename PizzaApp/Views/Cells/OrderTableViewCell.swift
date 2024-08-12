//
//  OrderTableViewCell.swift
//  PizzaApp
//
//  Created by Nurgali on 18.07.2023.
//

protocol TableViewCellCustomDelegate: class {
    func buttonTapped(index : Int, delta : Int)
}

import UIKit

class OrderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    
    weak var delegate: TableViewCellCustomDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func minusButtonClick(_ sender: UIButton) {
        delegate?.buttonTapped(index: sender.tag, delta: -1)
    }
    
    @IBAction func plusButtonClick(_ sender: UIButton) {
        delegate?.buttonTapped(index: sender.tag, delta: 1)
    }
    
}
