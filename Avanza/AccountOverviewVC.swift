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
        refreshControl?.addTarget(self, action: #selector(AccountOverviewVC.refresh(refreshControl:)), for: UIControlEvents.valueChanged)
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.backgroundColor = UIColor(named: "background-color")
        tableView.separatorColor = UIColor(named: "border-color")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the "native" UIRefreshControl elements...
        refreshControl?.tintColor = .clear
        // ... and add our custom refresh control:
        refreshControl?.addSubview(ptrView)
    }
    
    @objc func refresh(refreshControl: UIRefreshControl) {
        UIView.animate(withDuration: 0.5) {
            refreshControl.endRefreshing()
        }
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 260 : 64
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AccountOverviewCell") as! AccountOverviewTableViewCell
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell") as! AccountTableViewCell
        cell.iconView.image = UIImage(named: indexPath.row == 1 ? "af-account" : "spar-account")
        cell.accountNameLabel.text = indexPath.row == 1 ? "5708921" : "6256695 Collector"
        cell.detailsLabel.text = indexPath.row == 1 ? "Tillg. för köp 197 525" : "Ränta 0,70%"
        cell.valueDetailsLabel.isHidden = indexPath.row != 1
        cell.valueLabel.text = indexPath.row == 1 ? "585 314" : "200 081"
        return cell
    }

}
