//
//  Constants.swift
//  NSOperationDependencyDemo
//
//  Created by Amrendra on 08/11/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import Foundation
struct Constants {
    
    struct Environment {
        let DAV = "https://api.github.com"
        let PROD = ""
        let SQE = ""
    }
    
   struct API {
        static let REPOSITORY_URL = baseURL + "/legacy/repos/search/Go?language=%@"
        static let ISSUE_URL = baseURL + "/repos/%@/%@/issues"
        static let SINGLE_ISSUE_URL = baseURL + "/repos/%@/%@/issues/%@"
        static let CONTRIBUTORS_URL = baseURL + "/repos/%@/%@/contributors"
        static let MUSIC_URL = "http://api.androidhive.info/music/music.xml"
    }
    
    
    static let baseURL = Environment.init().DAV
    
    
    
}




//#define BASE_URL @"https://api.github.com"
//#define REPOSITORIES_URL @"/legacy/repos/search/Go?language=%@"
////#define REPOSITORIES_URL @"/search/repositories?q=language:%@"
//#define ISSUES_URL @"/repos/%@/%@/issues"
//#define SINGLE_ISSUE_URL @"/repos/%@/%@/issues/%@"
//#define CONTRIBUTORS_URL @"/repos/%@/%@/contributors"
