//
//  SaveTripViewController.swift
//  CoPath
//
//  Created by Henkky on 04/05/19.
//  Copyright © 2019 Henkky. All rights reserved.
//

import UIKit

class SaveTripViewController: UIViewController {
    
    var Lists : [ListDestination] = []
    
    @IBOutlet weak var listTable: UITableView!
    @IBAction func SaveTapped(_ sender: UIBarButtonItem) {
        
    }
    @IBOutlet weak var routeSeg: UISegmentedControl!
    
    @IBAction func routeChanged(_ sender: UISegmentedControl) {
        if routeSeg.selectedSegmentIndex == 0 {
            Lists[0] = ListDestination(title: "Test1", time: "00.00-01.00")
            Lists[1] = ListDestination(title: "Test2", time: "00.00-01.00")
            Lists[2] = ListDestination(title: "Test3", time: "00.00-01.00")
            Lists[3] = ListDestination(title: "Test4", time: "00.00-01.00")
            listTable.reloadData()
        } else if routeSeg.selectedSegmentIndex == 1 {
            print("Ok")
            Lists[0] = ListDestination(title: "Test1", time: "00.00-01.00")
            Lists[1] = ListDestination(title: "Test3", time: "00.00-01.00")
            Lists[2] = ListDestination(title: "Test2", time: "00.00-01.00")
            Lists[3] = ListDestination(title: "Test4", time: "00.00-01.00")
            //listTable.reloadData()
        } else if routeSeg.selectedSegmentIndex == 2 {
            Lists[0] = ListDestination(title: "Test1", time: "00.00-01.00")
            Lists[1] = ListDestination(title: "Test2", time: "00.00-01.00")
            Lists[2] = ListDestination(title: "Test3", time: "00.00-01.00")
            Lists[3] = ListDestination(title: "Test4", time: "00.00-01.00")
            listTable.reloadData()
        } else {
            Lists[0] = ListDestination(title: "Test1", time: "00.00-01.00")
            Lists[1] = ListDestination(title: "Test2", time: "00.00-01.00")
            Lists[2] = ListDestination(title: "Test3", time: "00.00-01.00")
            Lists[3] = ListDestination(title: "Test4", time: "00.00-01.00")
            listTable.reloadData()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Lists = createList(route : 0)
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
        return Lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let list = Lists[indexPath.row]
        let cellList = listTable.dequeueReusableCell(withIdentifier: "ListCell") as! ListDestinationCell
        cellList.setList(label: list)
        return cellList
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    
}


