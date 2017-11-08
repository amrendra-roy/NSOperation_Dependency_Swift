//
//  Utility.swift
//  NSOperationDependencyDemo
//
//  Created by Amrendra on 08/11/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import Foundation
import UIKit
struct Utility {
    
    
    static func showAlert(title: String, message: String, cancelBtn: String) -> UIAlertController {
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction.init(title: cancelBtn, style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        return alert
    }
    
    static func showAlert(title: String, message: String, okButton: String, handler:@escaping ( ()->() ) ) -> UIAlertController {
        let alert = self.showAlert(title: title, message: message, cancelBtn: "Cancel")
        let okAction = UIAlertAction.init(title: okButton, style: .default) { (action) in
            handler()
        }
        alert.addAction(okAction)
        return alert
    }
    
    
}
