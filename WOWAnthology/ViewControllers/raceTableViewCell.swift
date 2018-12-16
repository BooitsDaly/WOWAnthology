//
//  raceTableViewCell.swift
//  WOWAnthology
//
//  Created by Caitlyn Daly on 12/15/18.
//  Copyright © 2018 Caitlyn Daly. All rights reserved.
//

import UIKit

class raceTableViewCell: UITableViewCell {

    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var raceImage: UIImageView!
    @IBOutlet weak var factionNameText: UILabel!
    @IBOutlet weak var factions: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
