//
//  MapViewController.swift
//  FindMyCar
//
//  Created by Larry Heimann on 11/17/15.
//  Copyright (c) 2015 Larry Heimann. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
  
  @IBOutlet weak var mapView: MKMapView!
  
  var location = Location()

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // First part of the lab (making map based off current location; not used in main app)
//    location.getCurrentLocation()
//    let initialLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
//    centerMapOnLocation(initialLocation)
//    let dropPin = MKPointAnnotation()
//    dropPin.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
//    dropPin.title = "You Are Here"
//    mapView.addAnnotation(dropPin)
    
    // center the map on car's coordinates
    let carLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
    centerMapOnLocation(carLocation)
    
    // place a pin
    dropPin()
    
  }
  
  // set the size of the region to be displayed (measured in meters)
  let regionRadius: CLLocationDistance = 400
  
  func centerMapOnLocation(location: CLLocation) {
    let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
    mapView.setRegion(coordinateRegion, animated: true)
  }
  
  func dropPin() {
    let droppedPin = MKPointAnnotation()
    droppedPin.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
    droppedPin.title = "Your Car"
    mapView.addAnnotation(droppedPin)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

}
