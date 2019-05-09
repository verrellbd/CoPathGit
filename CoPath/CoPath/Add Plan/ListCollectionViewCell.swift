//
//  ListCollectionViewCell.swift
//  CoPath
//
//  Created by Dean Verrell on 09/05/19.
//  Copyright © 2019 Henkky. All rights reserved.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    
}

extension ListCollectionViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ListCollectionViewCell
    }
    
    
}
