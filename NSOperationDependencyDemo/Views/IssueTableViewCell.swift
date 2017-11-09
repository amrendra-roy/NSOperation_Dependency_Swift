//
//  IssueTableViewCell.swift
//  NSOperationDependencyDemo
//
//  Created by Amrendra on 09/11/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import UIKit

class IssueTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var issueNumber: UILabel!
    @IBOutlet weak var issueStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateIssueCellLayout(withModel model: IssueDM) {
        title.text = model.title
        issueNumber.text = String(format: "Issue Number: %d", model.issueNumber)
        issueStatus.text = model.state
    }
}
