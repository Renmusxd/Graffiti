//
//  GraffitiObject.swift
//  Graffiti
//
//  An object to hold basic graffiti information
//
//  Created by Sumner Hearth on 10/16/14.
//  Copyright (c) 2014 RenmusLabs. All rights reserved.
//

import UIKit

class GraffitiObject: NSObject {
    var id : String = ""
    // pos:     lat    long    h
    var pos : (Float, Float, Float) = (0,0,0)
    
    //Normal vector to plane of image
    var norm : (Float,Float,Float) = (0,0,0)
    // image data
    // ...
}
