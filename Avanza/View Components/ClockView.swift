//
//  ClockView.swift
//  Avanza
//
//  Created by Oskar Groth on 2017-07-02.
//  Copyright © 2017 Oskar Groth. All rights reserved.
//

import UIKit

class ClockView: UIView {
    
    let hand = CALayer()
    let steadyHand = CALayer()
    let circle = CALayer()
    
    func setup() {
        circle.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
        circle.borderWidth = 3
        circle.borderColor = UIColor(named: "icon-color")?.cgColor
        circle.cornerRadius = bounds.width / 2
        layer.addSublayer(circle)
        steadyHand.backgroundColor = UIColor(named: "icon-color")?.cgColor
        steadyHand.frame = CGRect(x: (bounds.width)/2 - 1, y: (bounds.height-3)/2, width: 9, height: 3)
        layer.addSublayer(steadyHand)
        hand.frame = CGRect(x: (bounds.width-3)/2, y: 5, width: 3, height: 10.5)
        //hand.anchorPoint = hand.frame.origin
        hand.backgroundColor = UIColor(named: "icon-color")?.cgColor
        layer.addSublayer(hand)
    }
    
    func rotate(degree: CGFloat) {
        let handDefaultRect = CGRect(x: (bounds.width-3)/2, y: 5, width: 3, height: 10.5)
        let center = CGPoint(x: handDefaultRect.midX, y: handDefaultRect.midY)
        let rotationPoint = CGPoint(x: bounds.midX, y: bounds.midY)
        var transform = CATransform3DIdentity
        transform = CATransform3DTranslate(transform, rotationPoint.x-center.x, rotationPoint.y-center.y, 0.0)
        transform = CATransform3DRotate(transform, CGFloat.pi*degree/180, 0.0, 0.0, -1.0)
        transform = CATransform3DTranslate(transform, center.x-rotationPoint.x, center.y-rotationPoint.y, 0.0)
        
        hand.transform = transform
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
