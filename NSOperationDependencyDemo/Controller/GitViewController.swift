//
//  ViewController.swift
//  NSOperationDependencyDemo
//
//  Created by Amrendra on 08/11/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import UIKit

class GitViewController: UIViewController {

    @IBOutlet weak var searchTxtField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - To Update the UI using ViewModel observer
    var viewModel: GitRepositoryViewModel! {
        didSet {
            viewModel.didChangedResults = { [unowned self] in
                    print("Json repo is = \(self.viewModel.resultsArray)")
                self.moveToRepositoryViewController(withResults: self.viewModel.resultsArray as! [RepositoryDM])
            }
            
            viewModel.didChangedStatus = { [unowned self] in
                switch self.viewModel.status {
                case .Running:
                    self.activityIndicator.startAnimating()
                case .Faild(let error):
                    self.activityIndicator.stopAnimating()
                    let alert = Utility.showAlert(title: NSLocalizedString("error_title", comment: ""), message: NSLocalizedString((error.localizedDescription), comment: ""), cancelBtn: NSLocalizedString("cancel_title", comment: ""))
                   self.present(alert, animated: true, completion: nil)
                    self.activityIndicator.stopAnimating()

                case .Success:
                    self.activityIndicator.stopAnimating()
                default:
                    print("viewModel.didChangedStatus default block run")
                }
            }
        }
    }
    //MARK: - View methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = GitRepositoryViewModel()
    }
    //MARK: - Helper Methods
    func moveToRepositoryViewController(withResults result: [RepositoryDM]) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "RepoListTableViewController") as! RepoListTableViewController
        vc.repoList = result
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
//MARK: - UITextFieldDelegate Implementation
extension GitViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        
        guard (textField.text?.isEmpty)! else {
           self.viewModel.fetchGitRepository(forLanguage: textField.text!)
            return true
        }
        
        let alert = Utility.showAlert(title: NSLocalizedString("error_title", comment: ""),
                                      message: NSLocalizedString("provide_language", comment: ""),
                                      cancelBtn: NSLocalizedString("cancel_title", comment: ""))
        self.present(alert, animated: true, completion: nil)
        return false
    }
}








