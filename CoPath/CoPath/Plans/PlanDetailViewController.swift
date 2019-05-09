//
//  PlanDetailViewController.swift
//  CoPath
//
//  Created by verine on 06/05/19.
//  Copyright © 2019 Henkky. All rights reserved.
//

import UIKit

class PlanDetailViewController: UIViewController {
    
    let list = ["Bali Botanical Garden", "Kuta Beach", "Hard Rock Hotel Bali"]
    let number = ["one", "two", "three"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension PlanDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }else {
            return number.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "CUSTOMIZED ROUTE"
        } else {
            return "LIST"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath) as! placeTableViewCell
        
        cell.numberImage.image = UIImage(named: number[indexPath.row] + ".jpg")
        cell.placeLabel.text = list[indexPath.row]
    //    cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    
}
