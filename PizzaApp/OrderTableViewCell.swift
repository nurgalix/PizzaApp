//
//  OrderTableViewCell.swift
//  PizzaApp
//
//  Created by Nurgali on 18.07.2023.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
