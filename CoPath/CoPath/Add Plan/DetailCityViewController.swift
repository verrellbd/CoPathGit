//
//  DetailCityViewController.swift
//  CoPath
//
//  Created by Dean Verrell on 04/05/19.
//  Copyright © 2019 Henkky. All rights reserved.
//

import UIKit

class DetailCityViewController: UIViewController {
    @IBOutlet weak var titleImage: UIImageView!
    var image : Image?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setUI()
        // Do any additional setup after loading the view.
    }
    
    
    func setUI() {
       titleImage.image = image?.image1
    }


}
