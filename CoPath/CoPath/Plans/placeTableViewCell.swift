//
//  placeTableViewCell.swift
//  CoPath
//
//  Created by verine on 09/05/19.
//  Copyright © 2019 Henkky. All rights reserved.
//

import UIKit

class placeTableViewCell: UITableViewCell {

    @IBOutlet weak var numberImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
