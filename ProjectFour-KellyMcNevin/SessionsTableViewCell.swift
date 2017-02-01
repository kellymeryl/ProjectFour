//
//  SessionsTableViewCell.swift
//  ProjectFour-KellyMcNevin
//
//  Created by Kelly McNevin on 1/31/17.
//  Copyright © 2017 Kelly McNevin. All rights reserved.
//

import UIKit

class SessionsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var efficiencyLabel: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
