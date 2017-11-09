//
//  GitRepositoryViewModel.swift
//  NSOperationDependencyDemo
//
//  Created by Amrendra on 08/11/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import UIKit

class GitRepositoryViewModel: NSObject, ViewModelProtocol {

    var resultsArray: [AnyObject] = [] {
        didSet {
            DispatchQueue.main.async {
                self.didChangedResults?()
            }
        }
    }
    
    var didChangedResults: (() -> ())?
    var didChangedStatus: (() -> ())?
    
    var status: RequestStatus {
        didSet {
            DispatchQueue.main.async {
                self.didChangedStatus?()
            }
        }
    }
    
    override init() {
        self.status = .Ideal
    }
    
    // MARK: -
     func fetchGitRepository(forLanguage language: String) {
        status = .Running
        
        let stringUrl = String.init(format: Constants.API.REPOSITORY_URL, language)
        ServiceManager.sharedInstance.startWebRequest(withUrl: stringUrl) { (data: Data?, error: Error?) in
            guard data != nil else {
                self.status = RequestStatus.setErrorDetail(error: error!)
                return
            }
            
            //Parsing
            let arr =  JsonParsingUtility.parseRepositoryData(data: data)
            self.resultsArray = arr
            self.status = .Success
        }
    }
    
}
