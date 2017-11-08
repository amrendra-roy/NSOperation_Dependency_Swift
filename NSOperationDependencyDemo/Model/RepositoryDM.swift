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
    var numberOfIssues: Int?
    var ownerName: String!
    var issueList: [IssueDM] = []
    var contributorsList: [ContributorsDM] = []
    
    init(withRepoModel dict: NSDictionary) {
        userName = dict["name"] as! String
        repoDesciption = dict["description"] as? String
        numberOfIssues = dict["open_issues"] as? Int
        ownerName = dict["owner"] as! String
        

        
        
    }
    
    
    
}


//static NSString * const kNumber = @"number";
//static NSString * const kTitle = @"title";
//static NSString * const kState = @"state";
//
//@implementation IssuesDM
//
//@synthesize issueNumber;
//@synthesize issueTitle;
//@synthesize issueState;

//static NSString * const kUserName = @"login";
//static NSString * const kContributNumber = @"contributions";
//
//
//@implementation ContributorsDM
//@synthesize contributerName;
//@synthesize contributionNumber;
