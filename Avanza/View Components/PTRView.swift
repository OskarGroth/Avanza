//
//  PTRView.swift
//  Avanza
//
//  Created by Oskar Groth on 2017-07-01.
//  Copyright © 2017 Oskar Groth. All rights reserved.
//

import UIKit

class PTRView: UIView {

    @IBOutlet weak var clockView: ClockView!
    @IBOutlet weak var updatedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let str = NSMutableAttributedString(string: "Senast uppdaterad 16:49:24", attributes: [.font: UIFont(name: "Ubuntu", size: 12)!])
        str.addAttribute(.font, value: UIFont(name: "Ubuntu-Medium", size: 12)!, range: NSRange(location:18,length:8))
        updatedLabel.attributedText = str
        updatedLabel.textColor = UIColor(named: "text-color")
    }

}
