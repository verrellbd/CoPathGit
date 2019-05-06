//
//  SaveTripViewController.swift
//  CoPath
//
//  Created by Henkky on 04/05/19.
//  Copyright © 2019 Henkky. All rights reserved.
//

import UIKit

class SaveTripViewController: UIViewController {
    
    var Lists1 : [ListDestination] = []
    var Lists2 : [ListDestination] = []
    var Lists3 : [ListDestination] = []
    var Lists4 : [ListDestination] = []
    
    
    @IBAction func saveTapped(_ sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: false)
    }
    
    @IBOutlet weak var listTable: UITableView!
    
    @IBOutlet weak var routeSeg: UISegmentedControl!
    
    @IBAction func routeChanged(_ sender: UISegmentedControl) {
        self.listTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listTable.delegate = self
        self.listTable.dataSource = self
        Lists1 = createList(route : 0)
        Lists2 = createList(route : 1)
        Lists3 = createList(route : 2)
        Lists4 = createList(route : 3)
        // Do any additional setup after loading the view.
    }
    
    func createList(route : Int) -> [ListDestination] {
        let List1 = ListDestination(title: "Test1", time: "00.00-01.00")
        let List2 = ListDestination(title: "Test2", time: "00.00-01.00")
        let List3 = ListDestination(title: "Test3", time: "00.00-01.00")
        let List4 = ListDestination(title: "Test4", time: "00.00-01.00")
        if route == 0 {
            return [List1,List2,List3,List4]
        } else if route == 1 {
            return [List2,List1,List3,List4]
        } else if route == 2 {
            return [List1,List2,List4,List3]
        } else {
            return [List4,List2,List3,List1]
        }
        
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

extension SaveTripViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Lists1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellList = listTable.dequeueReusableCell(withIdentifier: "ListCell") as! ListDestinationCell
        switch (routeSeg.selectedSegmentIndex) {
        case 0:
            let list1 = Lists1[indexPath.row]
            cellList.setList(label: list1)
            break
        case 1:
           // print("Masuk")
            let list2 = Lists2[indexPath.row]
            cellList.setList(label: list2)
            break
        case 2:
            let list3 = Lists3[indexPath.row]
            cellList.setList(label: list3)
            break
        case 3:
            let list4 = Lists4[indexPath.row]
            cellList.setList(label: list4)
            break
        default:
            break
        }
        return cellList
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    
}


