//
//  RepoListTableViewController.swift
//  NSOperationDependencyDemo
//
//  Created by Amrendra on 08/11/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import UIKit

class RepoListTableViewController: UITableViewController {

    var repoList = [RepositoryDM]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

         self.clearsSelectionOnViewWillAppear = false
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 80
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension RepoListTableViewController {
   
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repositoryTableViewCell", for: indexPath) as! RepositoryTableViewCell
        let model = repoList[indexPath.row]
        cell.updateRepositoryCell(withModel: model)
        return cell
    }
}
