//
//  ContributorTableViewCell.swift
//  NSOperationDependencyDemo
//
//  Created by Amrendra on 09/11/17.
//  Copyright © 2017 Amrendra. All rights reserved.
//

import UIKit

class ContributorTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var number: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateContributionCell(withModel model: ContributorsDM) {
        name.text = model.contributorName
        number.text = String(format: "%d", model.contributionNumber)
    }
}
