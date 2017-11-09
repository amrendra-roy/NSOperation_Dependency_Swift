//
//  RepositoryDM.swift
//  NSOperationDependencyDemo
//
//  Created by Amrendra on 08/11/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import UIKit

class RepositoryDM: NSObject {

    var userName: String!
    var repoDesciption: String?
    var numberOfIssues: Int = 0
    var ownerName: String!
    var issueList: [IssueDM] = []
    var contributorsList: [ContributorsDM] = []
    
    init(withRepoModel dict: NSDictionary) {
        userName = dict["name"] as! String
        repoDesciption = dict["description"] as? String
        numberOfIssues = dict["open_issues"] as! Int
        ownerName = dict["owner"] as! String
        

        
        
    }
}
