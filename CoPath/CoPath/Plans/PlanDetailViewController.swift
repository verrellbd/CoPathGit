//
//  PlanDetailViewController.swift
//  CoPath
//
//  Created by verine on 06/05/19.
//  Copyright © 2019 Henkky. All rights reserved.
//

import UIKit

class PlanDetailViewController: UIViewController {
    
    @IBAction func shareButton(_ sender: UIBarButtonItem) {
        let discardAlert = UIAlertController(title: "Delete All", message: "Are you sure want to delete all messages ? All changes will be lost.", preferredStyle: UIAlertController.Style.alert)
        
        discardAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(action: UIAlertAction!) in
            
        }))
        
        discardAlert.addAction(UIAlertAction(title: "Sign In", style: .default, handler: {(action: UIAlertAction!) in
            //self.navigationController?.popViewController(animated: true)
            self.performSegue(withIdentifier: "goToSignIn", sender: self)
        }))
        
        self.present(discardAlert, animated: true, completion: nil)
    }
    
    let list = ["Bali Botanical Garden", "Kuta Beach", "Hard Rock Hotel Bali"]
    
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
            return 3
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "placeCell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    
}
