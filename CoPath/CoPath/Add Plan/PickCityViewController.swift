//
//  CityViewController.swift
//  CoPath
//
//  Created by Dean Verrell on 03/05/19.
//  Copyright © 2019 Henkky. All rights reserved.
//

import UIKit

class PickCityViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    var images : [Image] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        images = createArray()
        setupNavbar()
        // Do any additional setup after loading the view.
    }
    
    func createArray() -> [Image]{
        let images1 = Image(image1: #imageLiteral(resourceName: "headerPicPlacesOnlyWeKnow"), image2: #imageLiteral(resourceName: "mentawaiPicNotifMessage"), image3: #imageLiteral(resourceName: "cityPopUpAddCity"), title: "Places Only We Know", subtitle: "Sometimes the diamonds are unrecognized")
        let images2 = Image(image1: #imageLiteral(resourceName: "cityPopUpAddCity"), image2: #imageLiteral(resourceName: "headerPicPlacesOnlyWeKnow"), image3: #imageLiteral(resourceName: "mentawaiPicNotifMessage"), title: "Historical Beauty", subtitle: "Looking back at the lengths we have gone to in the name of adventure")
        let images3 = Image(image1: #imageLiteral(resourceName: "mentawaiPicNotifMessage"), image2: #imageLiteral(resourceName: "cityPopUpAddCity"), image3: #imageLiteral(resourceName: "headerPicPlacesOnlyWeKnow"), title: "Historical Beauty", subtitle: "Looking back at the lengths we have gone to in the name of adventure")
        return [images1,images2,images3]
    }
    
    func setupNavbar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.title = "Pick a City"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CityToDetail" {
            let destVC = segue.destination as! DetailCityViewController
            destVC.image = sender as? Image
        }
    }
}

extension PickCityViewController: UITableViewDelegate, UITableViewDataSource {
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
        return 350.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let image = images[indexPath.row]
        performSegue(withIdentifier: "CityToDetail", sender: image)
    }
    
}
