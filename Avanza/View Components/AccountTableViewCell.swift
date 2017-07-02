//
//  AccountTableViewCell.swift
//  Avanza
//
//  Created by Oskar Groth on 2017-07-01.
//  Copyright © 2017 Oskar Groth. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var valueDetailsLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var valueCenterY: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        accountNameLabel.textColor = UIColor(named: "text-color")
        detailsLabel.textColor = UIColor(named: "text-color")
        valueLabel.textColor = UIColor(named: "text-color")
        valueDetailsLabel.textColor = UIColor(named: "blue-tint-color")
    }
    
    func setValueDetailsHidden(_ hidden: Bool) {
        valueDetailsLabel.isHidden = hidden
        valueCenterY.constant = hidden ? -1 : 9
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
        
}
