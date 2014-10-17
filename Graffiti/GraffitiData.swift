//
//  GraffitiData.swift
//  Graffiti
//
//  A bridge between the graffiti data server and the local device, contains
//  methods for graffiti querying and gps/acc information
//
//  Created by Sumner Hearth on 10/16/14.
//  Copyright (c) 2014 RenmusLabs. All rights reserved.
//

import UIKit
import CoreLocation
import CoreMotion

class GraffitiData: NSObject, CLLocationManagerDelegate {
   
    var manager : CLLocationManager!
    
    func setup(){
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        println("Setup")
    }
    
    func locationManager(manager:CLLocationManager, didUpdateLocations locations:[AnyObject]) {
        println("locations = \(locations)")
    }
    
    
    var local_graffiti : [GraffitiObject] = []
    
    // Pull local graffiti from server (even not visible)
    func updateGraffiti(){
        // Server work done here
    }
    
    // Returns a list of visible graffiti objects
    func getVisibleGraffiti() -> [GraffitiObject] {
        // Look at local repo
        return []
    }
    
    // Like a graffiti
    func plusGraffiti(id : String){}
    
    // Adds grafiti to the world, returns id
    func addGrafiti(graffiti : GraffitiObject) -> String{
        return ""
    }
    
    func getLocation() {
        
    }
    
}
