//
//  AccountOverviewHeaderView.swift
//  Avanza
//
//  Created by Oskar Groth on 2017-07-01.
//  Copyright © 2017 Oskar Groth. All rights reserved.
//

import UIKit

class AccountOverviewTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        for case let label as UILabel in contentView.subviews {
            // xcassets colors not working in xibs yet
            label.textColor = UIColor(named: "text-color")
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
