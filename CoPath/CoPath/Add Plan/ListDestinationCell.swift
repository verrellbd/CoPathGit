//
//  ListDestinationCell.swift
//  CoPath
//
//  Created by Dean Verrell on 04/05/19.
//  Copyright © 2019 Henkky. All rights reserved.
//

import UIKit

class ListDestinationCell: UITableViewCell {
   
    @IBOutlet weak var titleList: UILabel!
    
    @IBOutlet weak var timeList: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setList(label: String) {
        titleList.text = label
//        timeList.text = label.time
     }


}
