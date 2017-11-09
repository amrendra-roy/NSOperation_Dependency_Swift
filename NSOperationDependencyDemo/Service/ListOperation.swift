//
//  CustomOperation.swift
//  NSOperationDependencyDemo
//
//  Created by Amrendra on 09/11/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import UIKit
//https://gist.github.com/Sorix/57bc3295dc001434fe08acbb053ed2bc
class ListOperation: Operation {
    
    override var isAsynchronous: Bool { return true }
    override var isExecuting: Bool { return state == .executing }
    override var isFinished: Bool { return state == .finished }
    var viewModel: RepositoryDetailViewModel!
    private var url: String

    init(withUrl urlString: String) {
        self.url = String(format: urlString, "")
    }
    
    var state = State.ready {
        willSet {
            willChangeValue(forKey: state.keyPath)
            willChangeValue(forKey: newValue.keyPath)
        }
        didSet {
            didChangeValue(forKey: state.keyPath)
            didChangeValue(forKey: oldValue.keyPath)
        }
    }
    
    enum State: String {
        case ready = "Ready"
        case executing = "Executing"
        case finished = "Finished"
        fileprivate var keyPath: String { return "is" + self.rawValue }
    }
    
    override func start() {
        if self.isCancelled {
            state = .finished
        } else {
            state = .ready
            //Task is Here
            viewModel.fetchIssueDetail(fromUrl: self.url) {
                self.state = .finished
            }
        }
    }
    
    
    
    
    
}
