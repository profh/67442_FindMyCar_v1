//
//  DataManager.swift
//  FindMyCar
//
//  Created by Larry Heimann on 11/17/15.
//  Copyright (c) 2015 Larry Heimann. All rights reserved.
//

import Foundation

class DataManager {
  
  var carLocation = Location()
  
  init() {
     print("Documents folder is \(documentsDirectory())\n")
     print("Data file path is \(dataFilePath())")
  }
  
  func documentsDirectory() -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) 
    return paths[0]
  }
  
  func dataFilePath() -> String {
    return (documentsDirectory() as NSString).stringByAppendingPathComponent("CarLocation.plist")
  }
  
  func saveCarLocation() {
    let data = NSMutableData()
    let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
    archiver.encodeObject(carLocation, forKey: "Location")
    archiver.finishEncoding()
    data.writeToFile(dataFilePath(), atomically: true)
  }
  
  func loadCarLocation() {
    let path = dataFilePath()
    if NSFileManager.defaultManager().fileExistsAtPath(path) {
      if let data = NSData(contentsOfFile: path) {
        let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
        self.carLocation = unarchiver.decodeObjectForKey("Location") as! Location
        unarchiver.finishDecoding()
      }
    }
  }
  
  func generateMessage() -> String {
    let message = "Your car is currently at: \n( \(carLocation.latitude), \(carLocation.longitude) ) \n\nWhen you want a map to this location, simply press the 'Where is my car?' button."
    return message
  }
  
}