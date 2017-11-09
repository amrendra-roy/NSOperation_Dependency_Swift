//
//  ContributorsDM.swift
//  NSOperationDependencyDemo
//
//  Created by Amrendra on 08/11/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import Foundation
struct ContributorsDM {
    
    var contributorName: String!
    var contributionNumber: Int = 0
    
    init(withDictionary dict: NSDictionary) {
        contributorName = dict["login"] as? String
        contributionNumber = dict["contributions"] as! Int
    }
}
