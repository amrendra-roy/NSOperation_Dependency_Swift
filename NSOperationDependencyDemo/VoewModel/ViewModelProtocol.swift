//
//  ViewModelProtocol.swift
//  NSOperationDependencyDemo
//
//  Created by Amrendra on 08/11/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import Foundation

enum RequestStatus {
    case Ideal
    case Running
    case Faild (error: Error)
    case Success
    
    static func setErrorDetail(error: Error)->RequestStatus {
        let statusWithError = RequestStatus.Faild(error: error)
        return statusWithError
    }
}

protocol ViewModelProtocol {
    
    var resultsArray: [AnyObject] { get }
    var didChangedResults:( ()->() )? { get set }
    var didChangedStatus:(()->())? { get set }
    var status: RequestStatus { get set }
    

}
