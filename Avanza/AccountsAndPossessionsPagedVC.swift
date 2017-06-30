//
//  AccountsAndPossesionsPagedVC.swift
//  Avanza
//
//  Created by Oskar Groth on 2017-06-30.
//  Copyright © 2017 Oskar Groth. All rights reserved.
//

import UIKit

class AccountsAndPossessionsPagedVC: UIPageViewController, UIPageViewControllerDataSource {
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.createViewController("AccountOverviewVC"),
                self.createViewController("PositionsVC"),
                self.createViewController("NewsListVC"),
                self.createViewController("TransactionsVC")]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        let pageControl = PageControl(frame: CGRect(x: 0, y: 0, width: 320, height: 48))
        view.addSubview(pageControl)
        let scrollView = view.subviews.filter({$0.isKind(of: UIScrollView.self)}).first!
        scrollView.backgroundColor = UIColor.blue
        let heightConstraint = NSLayoutConstraint(item: scrollView, attribute: .top, relatedBy: .equal, toItem: pageControl, attribute: .bottom, multiplier: 1, constant: 0)
        view.addConstraint(heightConstraint)
        
    }
    
    private func createViewController(_ id: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: id)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        let previousIndex = index - 1
        guard previousIndex >= 0, orderedViewControllers.count > previousIndex else {
            return nil
        }
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        let nextIndex = index + 1
        guard orderedViewControllers.count > nextIndex else {
            return nil
        }
        return orderedViewControllers[index + 1]
    }
    
}
