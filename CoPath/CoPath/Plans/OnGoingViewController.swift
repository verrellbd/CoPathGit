//
//  OnGoingViewController.swift
//  CoPath
//
//  Created by verine on 04/05/19.
//  Copyright © 2019 Henkky. All rights reserved.
//

import UIKit

class OnGoingViewController: UIViewController {

    var list = ["Holiday in Semarang", "Family Trip to Medan"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

extension OnGoingViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "May 2019"
        } else {
            return "June 2019"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            // if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "mayCell", for: indexPath)
            cell.textLabel?.text = "Fun Trip 01"
            cell.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
            return cell
            // }
        } else {
            let cell = (tableView.dequeueReusableCell(withIdentifier: "juneCell", for: indexPath))
            cell.textLabel?.text = list[indexPath.row]
            cell.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
            return cell
        }
    }
}
