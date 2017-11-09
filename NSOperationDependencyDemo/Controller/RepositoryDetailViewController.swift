//
//  RepositoryDetailViewController.swift
//  NSOperationDependencyDemo
//
//  Created by Amrendra on 09/11/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import UIKit

class RepositoryDetailViewController: UIViewController {

    var repo: RepositoryDM!
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    var viewModel: RepositoryDetailViewModel! {
        didSet {
            self.viewModel.didChangedResults = {
                
                if self.viewModel.resultsArray is [IssueDM] {
                    self.repo.issueList = (self.viewModel.resultsArray as? [IssueDM])!
                    let set = IndexSet.init(integer: 1)
                    self.tblView.reloadSections(set, with: .fade)
                }else{
                    self.repo.contributorsList = (self.viewModel.resultsArray as? [ContributorsDM])!
                    self.tblView.reloadSections(IndexSet.init(integer: 2), with: .fade)
                }
            }
            
            self.viewModel.didChangedStatus = {
                switch self.viewModel.status {
                case .Success:
                    self.indicatorView.stopAnimating()
                case .Faild(let error):
                    self.indicatorView.stopAnimating()
                    let alert = Utility.showAlert(title: NSLocalizedString("", comment: ""), message: error.localizedDescription, cancelBtn: NSLocalizedString("", comment: ""))
                    self.present(alert, animated: true, completion: nil)
                case .Running:
                    self.indicatorView.startAnimating()
                default:
                    print("")
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Call web service
        if repo.issueList.isEmpty {
            let urlString = String(format: Constants.API.ISSUE_URL, repo.ownerName, repo.userName)
            self.viewModel.fetchIssueDetail(fromUrl: urlString)
        }
        
        if repo.contributorsList.isEmpty {
            let urlString = String(format: Constants.API.CONTRIBUTORS_URL, repo.ownerName, repo.userName)
            self.viewModel.fetchContributorDetail(fromUrl: urlString)
        }
        
        tblView.rowHeight = UITableViewAutomaticDimension
        tblView.estimatedRowHeight = 80

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension RepositoryDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section==0 {
            return 1
        }else if(section==1) {
          return repo.issueList.count
        }
        else {
         return repo.contributorsList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "repositoryTableViewCell", for: indexPath) as! RepositoryTableViewCell
            cell.updateRepositoryCell(withModel: self.repo)
            return cell
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "issueTableViewCell", for: indexPath) as! IssueTableViewCell
            let model = repo.issueList[indexPath.row]
            cell.updateIssueCellLayout(withModel: model)
            return cell

        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "contributorTableViewCell", for: indexPath) as! ContributorTableViewCell
            let model = repo.contributorsList[indexPath.row]
            cell.updateContributionCell(withModel: model)
            return cell

        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section==2) {
            return NSLocalizedString("contributor_info_header_title", comment: "")
        }
        else if (section==1) {
            return NSLocalizedString("issue_info_header_title", comment: "")
        }
        else {
            return NSLocalizedString("basic_info_header_title", comment: "")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 22
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
}





