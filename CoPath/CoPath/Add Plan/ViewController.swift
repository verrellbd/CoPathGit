//
//  ViewController.swift
//  CoPath
//
//  Created by Henkky on 02/05/19.
//  Copyright © 2019 Henkky. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    //image slider: place recommendation
    var placeImages = [UIImage(named: "place01AddPlan"),UIImage(named: "place02AddPlan"),UIImage(named: "place03AddPlan"), UIImage(named: "place04AddPlan")]
    
    //action when "new trip" button tapped
    @IBAction func newTripTap(_ sender: UIButton) {
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Notification messages
        let content = UNMutableNotificationContent()
        content.title = "Do you want to see the beautiful of the sea? Or great surfing experience?"
        content.body = "Come to Mentawai \nIn this place you can feel the fresh air, with the blue water of the sea."
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        
        let request = UNNotificationRequest(identifier: "notifIdentifier", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    //when back to "add plan" page hide navbar
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
}

//extension for collection view -> image slider
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    //how many items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return placeImages.count
    }
    
    //changing images per cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "placeRecommendationCell", for: indexPath) as? PlaceRecommendationCell
        cell?.img.image = placeImages[indexPath.row]
        return cell!
    }
}
