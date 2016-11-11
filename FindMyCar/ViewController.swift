//
//  ViewController.swift
//  FindMyCar
//
//  Created by Larry Heimann on 11/17/15.
//  Copyright (c) 2015 Larry Heimann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var location = Location()

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  @IBAction func recordCoordinates() {
    location.getCurrentLocation()
    
    let title = "Location Saved"
    let message = generateMessage()
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
    let action = UIAlertAction(title: "OK", style: .Default, handler: nil )
    
    alert.addAction(action)
    presentViewController(alert, animated: true, completion: nil)
  }
  
  func generateMessage() -> String {
    let message = "Your car is currently at: \n( \(location.latitude), \(location.longitude) ) \n\nWhen you want a map to this location, simply press the 'Where is my car?' button."
    return message
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "goToMap" {
      let showMap:MapViewController = segue.destinationViewController as! MapViewController
      showMap.location = self.location
    }
  }
  


}

