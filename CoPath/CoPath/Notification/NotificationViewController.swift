//
//  NotificationViewController.swift
//  CoPath
//
//  Created by Henkky on 04/05/19.
//  Copyright © 2019 Henkky. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {
    @IBOutlet weak var notifTable: UITableView!
    
    @IBOutlet weak var del: UIBarButtonItem!
    @IBAction func deleteAll(_ sender: UIBarButtonItem) {
        let discardAlert = UIAlertController(title: "Delete All", message: "Are you sure want to delete all messages ? All changes will be lost.", preferredStyle: UIAlertController.Style.alert)
        
        discardAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(action: UIAlertAction!) in
            
        }))
        
        discardAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(action: UIAlertAction!) in
            self.notif.removeAll()
            self.notifTable.reloadData()
            self.navigationController?.popViewController(animated: true)
        }))
        
        self.present(discardAlert, animated: true, completion: nil)
    }
    var index : Int = 0
    var notif : [String] = ["Have you check for update? The new version of Co-Path","Do you want to see the beautiful of the sea in mentawai","Hey Clarissa, are you ready for your trip? Make your trip more fun","Hey Clarissa, are you ready for your trip?  Make your trip more fun","HassanJr have sent you his/her plan. Check share plan "]
    override func viewDidLoad() {
        super.viewDidLoad()
//        let newBackButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(back(sender:)))
//        del = newBackButton
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! NotifDetail
        destVC.index = index
    }
    
    @objc func back(sender: UIBarButtonItem) {
        // Perform your custom actions
        let discardAlert = UIAlertController(title: "Discard Changes", message: "Are you sure want to leave? All changes will be lost.", preferredStyle: UIAlertController.Style.alert)
        
        discardAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(action: UIAlertAction!) in
            print("Handle Cancel logic here")
        }))
        
        discardAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(action: UIAlertAction!) in
            self.notif.removeAll()
            self.notifTable.reloadData()
            print("Handle Ok logic here")
            self.navigationController?.popViewController(animated: true)
        }))
        
        self.present(discardAlert, animated: true, completion: nil)
        // Go back to the previous ViewController
        //  self.navigationController?.popViewController(animated: true)
    }

}

extension NotificationViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notif.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotifCell", for: indexPath)
        cell.textLabel?.text = notif[indexPath.row]
        if indexPath.row == 0 {
            cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        } else if indexPath.row == 2 {
             cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        } else if indexPath.row == 3 {
             cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "NotifToDetail", sender: notif)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            notif.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
}
