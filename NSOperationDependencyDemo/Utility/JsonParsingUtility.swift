//
//  JsonParsingUtility.swift
//  NSOperationDependencyDemo
//
//  Created by Amrendra on 08/11/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import Foundation
struct JsonParsingUtility {
 
    static func parseRepositoryData(data: Data?)->[RepositoryDM] {
        
        do {
            let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? [String:AnyObject]
            
            guard let repository = json?["repositories"] as? [NSDictionary] else {
                return []
            }
            var arrOfResults = [RepositoryDM]()
            for repo in repository {
                let model = RepositoryDM(withRepoModel: repo)
                arrOfResults.append(model)
            }
            return arrOfResults
        } catch {
            print("JsonParsingUtility parseRepositoryData catch block")
            return []
        }
    }
    
    static func parseIssuessList(fromData data: Data?)->[IssueDM] {
        do {
            let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? [NSDictionary]
            guard json != nil else {
                return []
            }
            
            var arrOfResults = [IssueDM]()
            for dict in json! {
                let model = IssueDM(withDictionary: dict)
                arrOfResults.append(model)
            }
            return arrOfResults
        } catch {
            print("JsonParsingUtility parseIssuessList catch block")
            return []
        }
    }
    static func parseContributorList(fromData data: Data?)->[ContributorsDM] {
        do {
            let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? [NSDictionary]
            guard json != nil else {
                return []
            }
            
            var arrOfResults = [ContributorsDM]()
            for dict in json! {
                let model = ContributorsDM(withDictionary: dict)
                arrOfResults.append(model)
            }
            return arrOfResults
        } catch {
            print("JsonParsingUtility parseContributorList catch block")
            return []
        }
    }
    
}


