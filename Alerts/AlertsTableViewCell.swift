//
//  AlertsTableViewCell.swift
//  Alerts
//
//  Created by ksolves on 13/01/20.
//  Copyright © 2020 ksolves. All rights reserved.
//

import UIKit

class AlertsTableViewCell: UITableViewCell {

    @IBOutlet weak var textTitle: UILabel!
    @IBOutlet weak var textDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
