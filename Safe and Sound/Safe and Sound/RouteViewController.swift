//
//  RouteViewController.swift
//  Safe and Sound
//
//  Created by Medha Gupta on 3/25/18.
//  Copyright © 2018 HackUVA. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class RouteViewController: UIViewController {
    
    let startLat = 38.1
    let startLong = 78.5
    
    let endLat = 38.8
    let endLong = 77.0
    
    @IBOutlet var mapKitView: MKMapView!
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mapKitView.delegate = self as? MKMapViewDelegate
        mapKitView.showsUserLocation = true
        
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self as? MKMapViewDelegate as? CLLocationManagerDelegate
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        let sourceCoordinates = CLLocationCoordinate2D(latitude: startLat, longitude: startLong)
        let destCoordinates = CLLocationCoordinate2D(latitude: endLat, longitude: endLong)
        
        let sourcePlacemark = MKPlacemark(coordinate: sourceCoordinates)
        let destPlacemark = MKPlacemark(coordinate: destCoordinates)
        
        let sourceItem = MKMapItem(placemark: sourcePlacemark)
        let destItem = MKMapItem(placemark: destPlacemark)
        
        let directionRequest = MKDirectionsRequest()
        
        directionRequest.source = sourceItem
        directionRequest.destination = destItem
    directionRequest.transportType = .walking
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate(completionHandler:  {
            response, error in
            guard let response = response else {
                if let error = error{
                    print("Something went wrong")
                               }
                return
            }
            let route = response.routes[0]
            self.mapKitView.add(route.polyline, level: .aboveRoads)
            
            let rekt = route.polyline.boundingMapRect
            self.mapKitView.setRegion(MKCoordinateRegionForMapRect(rekt), animated: true)
        })
        
        
        
            }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer{
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 5.0
        return renderer
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
