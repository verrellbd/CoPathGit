//
//  Image.swift
//  CoPath
//
//  Created by Dean Verrell on 03/05/19.
//  Copyright © 2019 Henkky. All rights reserved.
//

import Foundation
import UIKit

class Image {
    let image1 : UIImage
    let image2 : UIImage
    let image3 : UIImage
    let title : String
    let subtitle : String
    
    
    init(image1 : UIImage,image2 : UIImage,image3 : UIImage, title :String, subtitle:String) {
        self.image1 = image1
        self.image2 = image2
        self.image3 = image3
        self.title = title
        self.subtitle = subtitle
    }
}
