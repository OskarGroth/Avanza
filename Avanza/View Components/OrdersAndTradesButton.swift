//
//  OrdersAndTradesButton.swift
//  Avanza
//
//  Created by Oskar Groth on 2017-06-30.
//  Copyright © 2017 Oskar Groth. All rights reserved.
//

import UIKit

class OrdersAndTradesButton: UIView {
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var label: UILabel!
    
    private func setup() {
        Bundle.main.loadNibNamed("OrdersAndTradesButton", owner: self, options: nil)
        self.addSubview(view)
        view.frame = self.bounds
        label.layer.backgroundColor = UIColor(named: "icon-color")?.cgColor
        label.layer.cornerRadius = label.bounds.width/2
        label.textColor = UIColor.white
    }
    
    override func prepareForInterfaceBuilder() {
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
}
