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
        setupNavbar()
        // Do any additional setup after loading the view.
    }
    
    func createArray() -> [Image]{
        let images1 = Image(image1: #imageLiteral(resourceName: "headerPicPlacesOnlyWeKnow"), image2: #imageLiteral(resourceName: "mentawaiPicNotifMessage"), image3: #imageLiteral(resourceName: "cityPopUpAddCity"))
        let images2 = Image(image1: #imageLiteral(resourceName: "cityPopUpAddCity"), image2: #imageLiteral(resourceName: "headerPicPlacesOnlyWeKnow"), image3: #imageLiteral(resourceName: "mentawaiPicNotifMessage"))
        let images3 = Image(image1: #imageLiteral(resourceName: "mentawaiPicNotifMessage"), image2: #imageLiteral(resourceName: "cityPopUpAddCity"), image3: #imageLiteral(resourceName: "headerPicPlacesOnlyWeKnow"))
        return [images1,images2,images3]
    }
    
    func setupNavbar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.title = "Pick a City"
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
