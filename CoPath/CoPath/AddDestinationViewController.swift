//
//  AddDestinationViewController.swift
//  CoPath
//
//  Created by Dean Verrell on 04/05/19.
//  Copyright © 2019 Henkky. All rights reserved.
//

import UIKit

class AddDestinationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        // Do any additional setup after loading the view.
    }
    
    func setupNavbar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.title = "Add Destination"
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
