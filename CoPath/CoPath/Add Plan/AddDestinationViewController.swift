//
//  AddDestinationViewController.swift
//  CoPath
//
//  Created by Henkky on 04/05/19.
//  Copyright © 2019 Henkky. All rights reserved.
//

import UIKit
import MapKit

class AddDestinationViewController: UIViewController, UISearchBarDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var listCollection: UICollectionView!
    @IBOutlet weak var imageCollection: UICollectionView!
    var recommendationImages = [UIImage(named: "jogja01"),UIImage(named: "jogja02"),UIImage(named: "jogja03"),UIImage(named: "jogja04")]
    let searchController = UISearchController(searchResultsController: nil)
    let searchButton = UIBarButtonItem()
    @IBOutlet weak var destinatioMap: MKMapView!
    var tempat: [ListDestination] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        // Do any additional setup after loading the view.
        
        // ALERT
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Pick a City", style: .plain, target: self, action: #selector(back(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton

    }
    
    @objc func back(sender: UIBarButtonItem) {
        // Perform your custom actions
        let discardAlert = UIAlertController(title: "Discard Changes", message: "Are you sure want to leave? All changes will be lost.", preferredStyle: UIAlertController.Style.alert)
        
        discardAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(action: UIAlertAction!) in
            print("Handle Cancel logic here")
        }))
        
        discardAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {(action: UIAlertAction!) in
            print("Handle Ok logic here")
            self.navigationController?.popViewController(animated: true)
        }))
        
        self.present(discardAlert, animated: true, completion: nil)
        // Go back to the previous ViewController
        //  self.navigationController?.popViewController(animated: true)
    }
    
    func setupNavbar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        navigationItem.hidesSearchBarWhenScrolling = false
//        navigationItem.title = "Destination"
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        print("Masuk")
//        //ignoring user
//        UIApplication.shared.beginIgnoringInteractionEvents()
//        //activity indicator
//        let activityIndicator = UIActivityIndicatorView()
//        activityIndicator.style = UIActivityIndicatorView.Style.gray
//        activityIndicator.center = self.view.center
//        activityIndicator.hidesWhenStopped = true
//        activityIndicator.startAnimating()
//
//
//        self.view.addSubview(activityIndicator)
//
//        //hide search bar
//        searchBar.resignFirstResponder()
//        dismiss(animated: true, completion: nil)
//
//        //create search request
//        let searchRequest = MKLocalSearch.Request()
//        searchRequest.naturalLanguageQuery = searchBar.text
//
//        let activeSearch = MKLocalSearch(request: searchRequest)
//        activeSearch.start {(response,error) in activityIndicator.stopAnimating()
//            UIApplication.shared.endIgnoringInteractionEvents()
//            if response == nil {
//                print("Error")
//            } else {
//
//
//                let latitude = response!.boundingRegion.center.latitude
//                let longtitude = response!.boundingRegion.center.longitude
//                let annotaion = MKPointAnnotation()
//                annotaion.title = searchBar.text
//                annotaion.coordinate = CLLocationCoordinate2DMake(latitude, longtitude)
//                self.destinatioMap.addAnnotation(annotaion)
//
//                let cordinate:CLLocationCoordinate2D =  CLLocationCoordinate2DMake(latitude, longtitude)
//                let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
//                let region = MKCoordinateRegion(center: cordinate, span: span)
//                //print(annotaion.coordinate)
//                self.destinatioMap.setRegion(region, animated: true)
//            }
//        }
        
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
        activeSearch.start { [unowned self] (response,error) in activityIndicator.stopAnimating()
            
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
                //location[click] = annotaion.coordinate
                let model = CoordinateModel()
                model.latitude = annotaion.coordinate.latitude
                model.longitude = annotaion.coordinate.longitude
                self.tempat.append(ListDestination(title: annotaion.title!, time: "00.00-01.00"))
                LocationModel.location.append(model)
                
                // print("array value: \(LocationModel.location.count)")
                // self.location[self.click] = annotaion.coordinate
                //                print(self.location.location[self.click].latitude)
                let cordinate:CLLocationCoordinate2D =  CLLocationCoordinate2DMake(latitude, longtitude)
                let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                let region = MKCoordinateRegion(center: cordinate, span: span)
                
                self.listCollection.reloadData()
                self.destinatioMap.setRegion(region, animated: true)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as? SaveTripViewController
        dest?.destination = self.tempat
    }
}

//tabanan : CLLocationCoordinate2D(latitude: -8.440359236767822, longitude: 115.06630246527493)
//ubud : CLLocationCoordinate2D(latitude: -8.517022900977185, longitude: 115.25612998288125)
//sanur : CLLocationCoordinate2D(latitude: -8.690784625592844, longitude: 115.26044456753885)
//kuta :CLLocationCoordinate2D(latitude: -8.725498511888688, longitude: 115.16205694992101)

extension AddDestinationViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == imageCollection {
            return recommendationImages.count
        } else {
            return LocationModel.location.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == imageCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recommendationCell", for: indexPath) as? RecommendationCell
            cell?.recommendationImg.image = recommendationImages[indexPath.row]
            return cell!
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listCell", for: indexPath) as? ListCollectionViewCell
            cell?.listLabel.text = tempat[indexPath.row].title
            //print(indexPath.row)
            return cell!
        }
    }
    
   
}
