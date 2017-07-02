//
//  NavigationController.swift
//  Avanza
//
//  Created by Oskar Groth on 2017-06-30.
//  Copyright © 2017 Oskar Groth. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.items?.first?.rightBarButtonItem = UIBarButtonItem(customView: OrdersAndTradesButton(frame: CGRect(x: 0, y: 0, width: 70, height: 50)))
        let font = UIFont(name: "Ubuntu-Bold", size: 18)!
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font.rawValue: font, NSAttributedStringKey.foregroundColor.rawValue: UIColor(named: "text-color")!]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
