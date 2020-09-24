//
//  ViewController.swift
//  Demo
//
//  Created by Mohit Gupta on 23/09/20.
//  Copyright © 2020 Mohit Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let viewModel = DemoScreenViewModel()
    let tableview = UITableView()
    let activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
//        configureActivityIndicator()
        self.activityIndicator.startAnimating()
        viewModel.factsData(successCallback: {[unowned self] (Facts) in
            self.activityIndicator.startAnimating()
            self.refreshUI()
        }) { (error) in
            print(error)
        }
    }
        
    func configureTableView() {
        tableview.dataSource = self
        tableview.estimatedRowHeight = 50
        tableview.rowHeight = UITableView.automaticDimension
        tableview.register(DemoTableViewCell.self, forCellReuseIdentifier: Cells.demoList)
        
        view.addSubview(tableview)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableview.tableFooterView = UIView(frame: .zero)
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(refreshAction), for: .valueChanged)
        tableview.refreshControl = refresh
    }
    
    func configureActivityIndicator() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerYAnchor.constraint(equalTo:view.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true


    }
    
    @objc func refreshAction() {
        tableview.refreshControl?.endRefreshing()
    }
    
    func refreshUI() {
        self.tableview.reloadData()
        self.navigationItem.title = self.viewModel.factsData?.title ?? ""
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.factsData?.rows.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: Cells.demoList, for: indexPath) as! DemoTableViewCell
        let row = self.viewModel.factsData?.rows[indexPath.row]
        cell.displayAlbumInCell(row: row!)
        return cell
    }
}
