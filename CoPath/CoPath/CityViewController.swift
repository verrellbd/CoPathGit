//
//  CityViewController.swift
//  CoPath
//
//  Created by Dean Verrell on 03/05/19.
//  Copyright © 2019 Henkky. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    var images : [Image] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        images = createArray()
        // Do any additional setup after loading the view.
    }
    
    func createArray() -> [Image]{
        let images1 = Image(image1: #imageLiteral(resourceName: "place3"), image2: #imageLiteral(resourceName: "test5"), image3: #imageLiteral(resourceName: "place1"))
        let images2 = Image(image1: #imageLiteral(resourceName: "test5"), image2: #imageLiteral(resourceName: "place1"), image3: #imageLiteral(resourceName: "place4"))
        let images3 = Image(image1: #imageLiteral(resourceName: "place3"), image2: #imageLiteral(resourceName: "test5"), image3: #imageLiteral(resourceName: "place3"))
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CityToDetail" {
            let destVC = segue.destination as! DetailCityViewController
            destVC.image = sender as? Image
        }
    }
}

extension CityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let image = images[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell") as! CityCell
        cell.setImage(image: image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let image = images[indexPath.row]
        performSegue(withIdentifier: "CityToDetail", sender: image)
    }
    
}
