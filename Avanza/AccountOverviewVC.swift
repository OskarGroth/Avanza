//
//  AccountOverviewVC.swift
//  Avanza
//
//  Created by Oskar Groth on 2017-06-30.
//  Copyright © 2017 Oskar Groth. All rights reserved.
//

import UIKit

class AccountOverviewVC: UITableViewController {
    
    @IBOutlet var ptrView: PTRView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "AccountOverviewTableViewCell", bundle: nil), forCellReuseIdentifier: "AccountOverviewCell")
        tableView.register(UINib(nibName: "AccountTableViewCell", bundle: nil), forCellReuseIdentifier: "AccountCell")
        tableView.register(UINib(nibName: "AccountActionTableViewCell", bundle: nil), forCellReuseIdentifier: "ActionCell")
        refreshControl?.tintColor = UIColor.clear
        refreshControl?.backgroundColor = UIColor.clear
        refreshControl?.addTarget(self, action: #selector(AccountOverviewVC.refresh(refreshControl:)), for: UIControlEvents.valueChanged)
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.backgroundColor = UIColor(named: "background-color")
        tableView.separatorColor = UIColor(named: "border-color")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let refreshControl = refreshControl else {
            return
        }
        ptrView.backgroundColor = UIColor.white
        ptrView.frame = CGRect(x: 0, y: -30, width: refreshControl.bounds.width, height: ptrView.bounds.height)
        refreshControl.addSubview(ptrView)
        let leadingConstraint = NSLayoutConstraint(item: ptrView, attribute: .leading, relatedBy: .equal, toItem: refreshControl, attribute: .leading, multiplier: 1, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: ptrView, attribute: .trailing, relatedBy: .equal, toItem: refreshControl, attribute: .trailing, multiplier: 1, constant: 0)
        refreshControl.addConstraints([leadingConstraint, trailingConstraint])
    }
    
    @objc func refresh(refreshControl: UIRefreshControl) {
        UIView.animate(withDuration: 0.5) {
            refreshControl.endRefreshing()
        }
    }
    
    // MARK: ScrollView Delegate Methods
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        ptrView.clockView.rotate(degree: scrollView.contentOffset.y*2)
    }
    
    // MARK: TableView Delegate/Datasource methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 260
        case 1:
            return 64
        case 2:
            return 64
        case 3:
            return 20
        case 4:
            return 64
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AccountOverviewCell") as! AccountOverviewTableViewCell
            let str = NSMutableAttributedString(string: "33,57 %", attributes: [.font: UIFont(name: "Ubuntu", size: 23)!])
            str.addAttribute(.font, value: UIFont(name: "Ubuntu", size: 19)!, range: NSRange(location:6,length:1))
            cell.developmentLabel.attributedText = str
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell") as! AccountTableViewCell
            cell.iconView.image = UIImage(named: "af-account")
            cell.accountNameLabel.text = "5708921"
            cell.detailsLabel.text = "Tillg. för köp 197 525"
            cell.valueLabel.text = "585 314"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell") as! AccountTableViewCell
            cell.iconView.image = UIImage(named: "spar-account")
            cell.accountNameLabel.text = "6256695 Collector"
            cell.detailsLabel.text = "Ränta 0,70%"
            cell.valueLabel.text = "200 081"
            cell.setValueDetailsHidden(true)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyCell")!
            cell.backgroundColor = UIColor.clear
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActionCell") as! AccountActionTableViewCell
            cell.separatorColor = tableView.separatorColor
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
}
