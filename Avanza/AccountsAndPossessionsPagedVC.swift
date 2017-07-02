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
    
    lazy var scrollView: UIScrollView = self.view.subviews.filter({$0.isKind(of: UIScrollView.self)}).first as! UIScrollView
    lazy var pageControl: PageControl = PageControl(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 48))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        setViewControllers([orderedViewControllers.first!], direction: .forward, animated: true, completion: nil)
        scrollView.superview?.addSubview(pageControl)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = CGRect(x: 0, y: pageControl.bounds.height, width: view.bounds.width, height: view.bounds.height - pageControl.bounds.height)
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
