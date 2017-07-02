//
//  AccountActionTableViewCell.swift
//  Avanza
//
//  Created by Oskar Groth on 2017-07-02.
//  Copyright © 2017 Oskar Groth. All rights reserved.
//

import UIKit

class AccountActionTableViewCell: UITableViewCell {
    
    var separatorColor: UIColor?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let ctx = UIGraphicsGetCurrentContext(), let color = separatorColor else {
            return
        }
        ctx.setFillColor(color.cgColor)
        let line = CGRect(x: rect.width/2-0.25, y: 0, width: 0.5, height: rect.height)
        ctx.fill(line)
    }
    
}
