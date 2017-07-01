//
//  PageControl.swift
//  Avanza
//
//  Created by Oskar Groth on 2017-06-30.
//  Copyright © 2017 Oskar Groth. All rights reserved.
//

import UIKit

class PageControl: UIPageControl {
    
    @IBOutlet var view: UIView!
    let border = CALayer()
    
    private func setup() {
        Bundle.main.loadNibNamed("PageControl", owner: self, options: nil)
        backgroundColor = UIColor(named: "background-color")
        addSubview(view)
        view.frame = self.bounds
        border.backgroundColor = UIColor(named: "border-color")?.cgColor
        layer.addSublayer(border)
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Update border width
        border.frame = CGRect(x: 0, y: bounds.height - 0.5, width: bounds.width, height: 0.5)
    }

}
