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
    
    private func setup() {
        Bundle.main.loadNibNamed("PageControl", owner: self, options: nil)
        self.addSubview(view)
        view.frame = self.bounds
        
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
