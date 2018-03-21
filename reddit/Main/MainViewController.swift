//
//  MainViewController.swift
//  reddit
//
//  Created by Philip Starner on 3/20/18.
//  Copyright © 2018 Philip Starner. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var tableView: UITableView!
    var listings:[Children]?
    
    var pageLock = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData(after: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI() {
        self.title = "Organic"
        
        self.tableView = UITableView()
        self.view.addSubview(tableView)
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        self.tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        self.tableView.backgroundColor = .white
        self.tableView.showsVerticalScrollIndicator = false
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 80.0
        
        self.tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "cell")
        
        //add footer
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 50))
        footerView.backgroundColor = Constants.COLOR_AQUA
        let activityIndidator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        footerView.addSubview(activityIndidator)
        activityIndidator.startAnimating()
        activityIndidator.translatesAutoresizingMaskIntoConstraints = false
        activityIndidator.centerXAnchor.constraint(equalTo: footerView.centerXAnchor).isActive = true
        activityIndidator.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true

        self.tableView.tableFooterView = footerView
    }
    
    func loadData(after: String?) {
        APIManager.sharedInstance.getOrganic(after: after, limit: 20) { (recievedListings, error) in
            self.pageLock = false
            if self.listings == nil {
                self.listings = recievedListings
            } else {
                self.listings = self.listings! + recievedListings!
            }
            self.tableView.reloadData()
        }
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = self.listings?.count {
            return count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MainTableViewCell
        
        cell.loadModel(data: self.listings?[indexPath.item].data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.title = "Detail"
        if let domain = self.listings?[indexPath.item].data?.domain {
            vc.title = domain
        }
        if let url = self.listings?[indexPath.item].data?.url {
            vc.urlString = url
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height
        
        if (bottomEdge >= scrollView.contentSize.height)
        {
            if !pageLock {
                pageLock = true
                if let listings = self.listings {
                    let afterString = listings[listings.count - 1].data?.name
                    loadData(after: afterString)
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let customView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 50))
//        customView.backgroundColor = Constants.COLOR_AQUA
//
//        return customView
//    }
}

