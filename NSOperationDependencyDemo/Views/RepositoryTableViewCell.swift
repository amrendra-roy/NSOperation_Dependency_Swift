//
//  RepositoryTableViewCell.swift
//  NSOperationDependencyDemo
//
//  Created by Amrendra on 08/11/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var openIssues: UILabel!
    @IBOutlet weak var detail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func updateRepositoryCell(withModel model: RepositoryDM) {
        title.text = model.ownerName
        openIssues.text = String(format: "Open Issues: %d", model.numberOfIssues)
        detail.text = model.repoDesciption
    }
}
