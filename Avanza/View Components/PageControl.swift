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
    let borders: [CALayer] = [CALayer(), CALayer()]
    
    private func setup() {
        Bundle.main.loadNibNamed("PageControl", owner: self, options: nil)
        backgroundColor = UIColor(named: "background-color")
        addSubview(view)
        view.frame = self.bounds
        for borderLayer in borders {
            borderLayer.backgroundColor = UIColor(named: "border-color")?.cgColor
            layer.addSublayer(borderLayer)
        }
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
        borders.forEach({$0.frame = CGRect(x: 0, y: borders.index(of: $0) == 0 ? 0 : bounds.height - 1, width: bounds.width, height: 1)})
    }

}
