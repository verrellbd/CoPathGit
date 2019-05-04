//
//  addPlanController.swift
//  CoPath
//
//  Created by Dean Verrell on 03/05/19.
//  Copyright © 2019 Henkky. All rights reserved.
//

import UIKit

class addPlanController: UIViewController {

    @IBOutlet weak var startField: UITextField!
    
    @IBOutlet weak var endField: UITextField!
    
    let datePicker = UIDatePicker()
    let endPicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(addPlanController.dateChanged(datePicker:)), for: .valueChanged)
        endPicker.datePickerMode = .date
        endPicker.addTarget(self, action: #selector(addPlanController.endDateChanged(endPicker:)), for: .valueChanged)
        //startField.inputView = datePicker
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(addPlanController.viewTapped(gestureRecognize:)))
        
        view.addGestureRecognizer(tapGesture)
        startField.inputView = datePicker
        endField.inputView = endPicker
        // Do any additional setup after loading the view.
    }
    
    @objc func viewTapped(gestureRecognize : UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker : UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        startField.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    @objc func endDateChanged(endPicker : UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        endField.text = dateFormatter.string(from: endPicker.date)
        view.endEditing(true)
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
