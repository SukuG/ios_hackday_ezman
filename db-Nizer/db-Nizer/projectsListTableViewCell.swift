//
//  projectsListTableViewCell.swift
//  db-Nizer
//
//  Created by jaswanth on 25/03/17.
//  Copyright © 2017 doodleblue. All rights reserved.
//

import UIKit

class projectsListTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var ProjectNameLabel :UILabel!
   // @IBOutlet weak var ProjectStatusLabeL:UILabel!
    @IBOutlet weak var projectSatrtDateLabel:UILabel!
    @IBOutlet weak var projectMANGERNAME:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
