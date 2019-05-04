//
//  CityCell.swift
//  CoPath
//
//  Created by Dean Verrell on 03/05/19.
//  Copyright © 2019 Henkky. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {

    @IBOutlet weak var imageCell2: UIImageView!
    @IBOutlet weak var imageCell3: UIImageView!
    @IBOutlet weak var imageCell1: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setImage(image: Image) {
        imageCell1.image = image.image1
        imageCell2.image = image.image2
        imageCell3.image = image.image3
    }

}
