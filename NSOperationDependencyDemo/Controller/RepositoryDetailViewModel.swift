//
//  RepositoryDetailViewModel.swift
//  NSOperationDependencyDemo
//
//  Created by Amrendra on 09/11/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import Foundation

class RepositoryDetailViewModel: ViewModelProtocol {
    
    var resultsArray: [AnyObject] = [] {
        didSet {
            DispatchQueue.main.async {
                self.didChangedResults?()
            }
        }
    }

    var didChangedStatus: (() -> ())?
    var didChangedResults: (() -> ())?
    
    var status: RequestStatus = .Ideal {
        didSet {
            DispatchQueue.main.async {
                self.didChangedStatus?()
            }
        }
    }

    #if PerformUsingOperation
    func fetchIssueDetail(fromUrl urlString: String) {
       print("test Opertion calling")
    }
    
    func fetchContributorDetail(fromUrl urlString: String) {
       print("test Opertion calling")
    
    }
    
    #else
   
    func fetchIssueDetail(fromUrl urlString: String) {
        status = .Running
        ServiceManager.sharedInstance.startWebRequest(withUrl: urlString) { (data: Data?, error: Error?) in
            guard data != nil else {
                self.status = RequestStatus.setErrorDetail(error: error!)
                return
            }
            //Parsing
            let arr = JsonParsingUtility.parseIssuessList(fromData: data)
            self.resultsArray = arr as [AnyObject]
            self.status = .Success
        }
    }
    func fetchContributorDetail(fromUrl urlString: String) {
        status = .Running
        ServiceManager.sharedInstance.startWebRequest(withUrl: urlString) { (data: Data?, error: Error?) in
            guard data != nil else {
                self.status = RequestStatus.Faild(error: error!)
                return
            }
            //Parsing
            let arr = JsonParsingUtility.parseContributorList(fromData: data)
            self.resultsArray = arr as [AnyObject]
            self.status = .Success
        }
    }
    #endif
    
    
    
}
