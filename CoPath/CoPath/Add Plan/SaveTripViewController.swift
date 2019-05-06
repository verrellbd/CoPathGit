//
//  SaveTripViewController.swift
//  CoPath
//
//  Created by Henkky on 04/05/19.
//  Copyright © 2019 Henkky. All rights reserved.
//

import UIKit
import MapKit

class customPin: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    
    init(pinTitle:String, pinSubTitle:String, location:CLLocationCoordinate2D) {
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
    }
}

class SaveTripViewController: UIViewController, MKMapViewDelegate {
    
    var Lists1 : [ListDestination] = []
    var Lists2 : [ListDestination] = []
    var Lists3 : [ListDestination] = []
    var Lists4 : [ListDestination] = []
    
    
    @IBOutlet weak var mapView: MKMapView!
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
        
        // ALERT
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(back(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton
        let tamanPintar = CLLocationCoordinate2D(latitude: -7.801647777910315, longitude: 110.36947967950255)
        let malioboro = CLLocationCoordinate2D(latitude: -7.793743704349689, longitude: 110.36279812920839)
        let borobudur = CLLocationCoordinate2D(latitude: -7.607930784579451, longitude: 110.20384518429637)
        let tamanSari = CLLocationCoordinate2D(latitude: -7.809999443125113, longitude: 110.35902853589505)
        
        let tamanPintarPin = customPin(pinTitle: "Taman Pintar", pinSubTitle: "", location: tamanPintar)
        let malioboroPin = customPin(pinTitle: "Malioboro", pinSubTitle: "", location: malioboro)
        let borobudurPin = customPin(pinTitle: "Candi Borobudur", pinSubTitle: "", location: borobudur)
        let tamanSariPin = customPin(pinTitle: "Taman Sari", pinSubTitle: "", location: tamanSari)
        
        self.mapView.addAnnotation(tamanPintarPin)
        self.mapView.addAnnotation(malioboroPin)
        self.mapView.addAnnotation(borobudurPin)
        self.mapView.addAnnotation(tamanSariPin)
        
        let tamanPintarPlaceMark = MKPlacemark(coordinate: tamanPintar)
        let malioboroPlaceMark = MKPlacemark(coordinate: malioboro)
        let borobudurPlaceMark = MKPlacemark(coordinate: borobudur)
        let tamanSariPlaceMark = MKPlacemark(coordinate: tamanSari)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = MKMapItem(placemark: tamanSariPlaceMark)
        directionRequest.destination = MKMapItem(placemark: tamanPintarPlaceMark)
        directionRequest.transportType = .automobile
        
        let directionRequest1 = MKDirections.Request()
        directionRequest1.source = MKMapItem(placemark: tamanPintarPlaceMark)
        directionRequest1.destination = MKMapItem(placemark: malioboroPlaceMark)
        directionRequest1.transportType = .automobile
        
        let directionRequest2 = MKDirections.Request()
        directionRequest2.source = MKMapItem(placemark: malioboroPlaceMark)
        directionRequest2.destination = MKMapItem(placemark: borobudurPlaceMark)
        directionRequest2.transportType = .automobile
        
        
        let directions = MKDirections(request: directionRequest)
        let directions1 = MKDirections(request: directionRequest1)
        let directions2 = MKDirections(request: directionRequest2)
        
        directions.calculate { (response, error) in
            guard let directionResonse = response else {
                if let error = error {
                    print("we have error getting directions==\(error.localizedDescription)")
                }
                return
            }
            
            let route = directionResonse.routes[0]
            self.mapView.addOverlay(route.polyline, level: .aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
        }
        
        directions1.calculate { (response, error) in
            guard let directionResonse = response else {
                if let error = error {
                    print("we have error getting directions==\(error.localizedDescription)")
                }
                return
            }
            
            let route = directionResonse.routes[0]
            self.mapView.addOverlay(route.polyline, level: .aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
        }
        
        directions2.calculate { (response, error) in
            guard let directionResonse = response else {
                if let error = error {
                    print("we have error getting directions==\(error.localizedDescription)")
                }
                return
            }
            
            let route = directionResonse.routes[0]
            self.mapView.addOverlay(route.polyline, level: .aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
        }
        self.mapView.delegate = self as! MKMapViewDelegate
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 4.0
        return renderer
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


