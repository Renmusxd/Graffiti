//
//  LocationManager.swift
//  Graffiti
//
//  Created by Sumner Hearth on 10/16/14.
//  Copyright (c) 2014 RenmusLabs. All rights reserved.
//

import UIKit
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    
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
    
}
