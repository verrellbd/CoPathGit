//
//  NotifDetail.swift
//  CoPath
//
//  Created by Dean Verrell on 05/05/19.
//  Copyright © 2019 Henkky. All rights reserved.
//

import UIKit

class NotifDetail: UIViewController {

    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var desc1: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var desc2: UILabel!
    var index : Int = 0
    var timeNotif : [String] = ["Fri, May 20, 2019","Sat, May 21, 2019","Sun, May 22, 2019","Mon, May 23, 2019","Tue, May 24, 2019"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }
    
    func setUI(){
        if index == 0 {
            time.text = timeNotif[0]
        } else if index == 1 {
            time.text = timeNotif[1]
        } else if index == 2 {
            time.text = timeNotif[2]
        } else if index == 3 {
            time.text = timeNotif[3]
        } else if index == 4 {
            time.text = timeNotif[4]
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
