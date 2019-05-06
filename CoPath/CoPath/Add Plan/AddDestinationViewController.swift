//
//  AddDestinationViewController.swift
//  CoPath
//
//  Created by Henkky on 04/05/19.
//  Copyright © 2019 Henkky. All rights reserved.
//

import UIKit
import MapKit

class AddDestinationViewController: UIViewController, UISearchBarDelegate {
    
    var recommendationImages = [UIImage(named: "rec1")]
    let searchController = UISearchController(searchResultsController: nil)
    let searchButton = UIBarButtonItem()
    @IBOutlet weak var destinatioMap: MKMapView!
//    @IBAction func searchButton(_ sender: Any) {
//        searchController.searchBar.delegate = self
//        present(searchController, animated: true, completion: nil)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        // Do any additional setup after loading the view.
    }
    
    func setupNavbar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        navigationItem.hidesSearchBarWhenScrolling = false
//        navigationItem.title = "Destination"
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Masuk")
        //ignoring user
        UIApplication.shared.beginIgnoringInteractionEvents()
        //activity indicator
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        
        self.view.addSubview(activityIndicator)
        
        //hide search bar
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        
        //create search request
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchBar.text
        
        let activeSearch = MKLocalSearch(request: searchRequest)
        activeSearch.start {(response,error) in activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            if response == nil {
                print("Error")
            } else {
            
                
                let latitude = response!.boundingRegion.center.latitude
                let longtitude = response!.boundingRegion.center.longitude
                let annotaion = MKPointAnnotation()
                annotaion.title = searchBar.text
                annotaion.coordinate = CLLocationCoordinate2DMake(latitude, longtitude)
                self.destinatioMap.addAnnotation(annotaion)
                
                let cordinate:CLLocationCoordinate2D =  CLLocationCoordinate2DMake(latitude, longtitude)
                let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                let region = MKCoordinateRegion(center: cordinate, span: span)
                //print(annotaion.coordinate)
                self.destinatioMap.setRegion(region, animated: true)
            }
        }
    }
    
    
}

//tabanan : CLLocationCoordinate2D(latitude: -8.440359236767822, longitude: 115.06630246527493)
//ubud : CLLocationCoordinate2D(latitude: -8.517022900977185, longitude: 115.25612998288125)
//sanur : CLLocationCoordinate2D(latitude: -8.690784625592844, longitude: 115.26044456753885)
//kuta :CLLocationCoordinate2D(latitude: -8.725498511888688, longitude: 115.16205694992101)

extension AddDestinationViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendationImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recommendationCell", for: indexPath) as? RecommendationCell
        cell?.recommendationImg.image = recommendationImages[indexPath.row]
        return cell!
    }
}
