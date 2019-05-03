//
//  CityViewController.swift
//  CoPath
//
//  Created by Dean Verrell on 03/05/19.
//  Copyright © 2019 Henkky. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {
    @IBOutlet weak var cityList: UITableView!
    var images : [Image] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        images = createArray()
        // Do any additional setup after loading the view.
    }
    
    func createArray() -> [Image]{
        let images1 = Image(image1: #imageLiteral(resourceName: "beginner-first-app"), image2: #imageLiteral(resourceName: "beginner-first-app"), image3: #imageLiteral(resourceName: "beginner-first-app"))
        let images2 = Image(image1: #imageLiteral(resourceName: "beginner-first-app"), image2: #imageLiteral(resourceName: "beginner-first-app"), image3: #imageLiteral(resourceName: "beginner-first-app"))
        let images3 = Image(image1: #imageLiteral(resourceName: "beginner-first-app"), image2: #imageLiteral(resourceName: "beginner-first-app"), image3: #imageLiteral(resourceName: "beginner-first-app"))
        return [images1,images2,images3]
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

extension CityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let image = images[indexPath.row]
        let cell = cityList.dequeueReusableCell(withIdentifier: "CityCell") as! CityCell
        cell.setImage(image: image)
        
        return cell
    }
    
    
}
