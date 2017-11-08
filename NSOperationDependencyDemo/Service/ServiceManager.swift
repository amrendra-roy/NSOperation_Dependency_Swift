//
//  ServiceManager.swift
//  NSOperationDependencyDemo
//
//  Created by Amrendra on 08/11/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import UIKit

class ServiceManager: NSObject {

    let session: URLSession
    
    static let sharedInstance = ServiceManager()
    
    private override init() {
        session = URLSession.shared
    }
    
    // MARK: - start web services
    func startWebRequest(withUrl strUrl: String, completionHandler: @escaping (Data?, Error?)->Void) {
        let url = URL.init(string: strUrl)
        print("Web Request for = \(String(describing: url))")
        let task = session.dataTask(with: url!) { (data: Data?, response: URLResponse?, error: Error?) in
            guard data != nil else {
                completionHandler(nil, error)
                return
            }
            completionHandler(data, nil)
        }
        task.resume()
    }
}
