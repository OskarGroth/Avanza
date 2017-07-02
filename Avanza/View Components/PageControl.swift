//
//  PageControl.swift
//  Avanza
//
//  Created by Oskar Groth on 2017-06-30.
//  Copyright © 2017 Oskar Groth. All rights reserved.
//

import UIKit

class PageControl: UIPageControl {
    
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet var view: UIView!
    let border = CALayer()
    let pageIndicator = CALayer()
    
    private func setup() {
        Bundle.main.loadNibNamed("PageControl", owner: self, options: nil)
        backgroundColor = UIColor(named: "background-color")
        overviewLabel.textColor = UIColor(named: "text-selected-color")
        addSubview(view)
        view.frame = self.bounds
        border.backgroundColor = UIColor(named: "border-color")?.cgColor
        layer.addSublayer(border)
        pageIndicator.frame = CGRect(x: overviewLabel.frame.origin.x, y: bounds.height-2, width: overviewLabel.frame.width, height: 2)
        pageIndicator.backgroundColor = UIColor(named: "text-selected-color")?.cgColor
        layer.addSublayer(pageIndicator)
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
