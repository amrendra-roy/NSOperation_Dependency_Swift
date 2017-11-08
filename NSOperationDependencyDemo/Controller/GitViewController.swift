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
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func fetchGitRepository(forLanguage language: String) {
        let stringUrl = String.init(format: Constants.API.REPOSITORY_URL, language)
        ServiceManager.sharedInstance.startWebRequest(withUrl: stringUrl) { (data: Data?, error: Error?) in
            guard data != nil else {
              let alert = Utility.showAlert(title: NSLocalizedString("error_title", comment: ""), message: NSLocalizedString((error?.localizedDescription)!, comment: ""), cancelBtn: NSLocalizedString("cancel_title", comment: ""))
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            //Parsing
           let arr =  JsonParsingUtility.parseRepositoryData(data: data)
            print("Json repo is = \(arr)")
        }
    }

}

extension GitViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        
        guard (textField.text?.isEmpty)! else {
            
            fetchGitRepository(forLanguage: textField.text!)
            return true
        }
        
        let alert = Utility.showAlert(title: NSLocalizedString("error_title", comment: ""),
                                      message: NSLocalizedString("provide_language", comment: ""),
                                      cancelBtn: NSLocalizedString("cancel_title", comment: ""))
        self.present(alert, animated: true, completion: nil)

        return false
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    
}
