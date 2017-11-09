//
//  IssueDM.swift
//  NSOperationDependencyDemo
//
//  Created by Amrendra on 08/11/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import Foundation

struct IssueDM {
    var issueNumber: Int = 0
    var title: String?
    var state: String?
    
    init(withDictionary dict: NSDictionary) {
        
        issueNumber = dict["number"] as! Int
        title = dict["title"] as? String
        state = dict["state"] as? String
    }
}
