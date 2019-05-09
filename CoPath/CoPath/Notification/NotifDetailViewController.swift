//
//  NotifDetail.swift
//  CoPath
//
//  Created by Dean Verrell on 05/05/19.
//  Copyright © 2019 Henkky. All rights reserved.
//

import UIKit

class NotifDetailViewController: UIViewController {

    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var desc1: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var desc2: UILabel!
    var index : Int = 0
    var timeNotif : [String] = ["Fri, May 20, 2019","Sat, May 21, 2019","Sun, May 22, 2019","Mon, May 23, 2019","Tue, May 24, 2019"]
    var descNotif : String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }
    
    func setUI(){
        if index == 0 {
            time.text = timeNotif[0]
            desc1.text = descNotif
            desc2.text = descNotif
            image.image = #imageLiteral(resourceName: "mentawaiPicNotifMessage")
        } else if index == 1 {
            time.text = timeNotif[1]
            desc1.text = descNotif
            desc2.text = descNotif
            image.image = #imageLiteral(resourceName: "mentawaiPicNotifMessage")
        } else if index == 2 {
            time.text = timeNotif[2]
            desc1.text = descNotif
            desc2.text = descNotif
            image.image = #imageLiteral(resourceName: "mentawaiPicNotifMessage")
        } else if index == 3 {
            time.text = timeNotif[3]
            desc1.text = descNotif
            desc2.text = descNotif
            image.image = #imageLiteral(resourceName: "mentawaiPicNotifMessage")
        } else if index == 4 {
            time.text = timeNotif[4]
            desc1.text = descNotif
            desc2.text = descNotif
            image.image = #imageLiteral(resourceName: "mentawaiPicNotifMessage")
        }
        
    }

}
