//
//  ViewController.swift
//  CoPath
//
//  Created by Henkky on 02/05/19.
//  Copyright © 2019 Henkky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var placeImages = [UIImage(named: "place01AddPlan"),UIImage(named: "place02AddPlan")]
    
    @IBAction func newTripTap(_ sender: UIButton) {
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = false
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return placeImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PlaceRecommendationCell
        cell?.img.image = placeImages[indexPath.row]
        return cell!
    }
}
