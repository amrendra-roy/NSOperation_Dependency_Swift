//
//  CustomOperation.swift
//  NSOperationDependencyDemo
//
//  Created by Amrendra on 09/11/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import UIKit

class CustomOperation: Operation {

    private var _finished = false
    private var _executing = false
    private var url: URL?
    
    override var isExecuting: Bool {
        get {
            return _executing
        }
        set {
            self.willChangeValue(forKey: "isExecuting")
            _executing = newValue
            print("\(String(describing: self.url)) is executing")
            self.didChangeValue(forKey: "isExecuting")
        }
    }
    override var isFinished: Bool {
        get {
            return _finished
        }
        set {
            self.willChangeValue(forKey: "isFinished")
            _finished = newValue
            print("\(String(describing: self.url)) has been Finished")
            self.didChangeValue(forKey: "isFinished")
        }
    }
    override var isAsynchronous: Bool {
        return true
    }
    override func start() {
        if isCancelled {
            _finished = true
            print("\(String(describing: self.url)) has been cancelled")
            return
        }
        _executing = true
        
        
    }
    
    init(withUrl urlString: String) {
        self.url = URL.init(string: urlString)
    }
    
    
    
    
    
    
}
