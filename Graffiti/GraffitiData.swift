//
//  GraffitiData.swift
//  Graffiti
//
//  Created by Sumner Hearth on 10/16/14.
//  Copyright (c) 2014 RenmusLabs. All rights reserved.
//

import UIKit

class GraffitiData: NSObject {
   
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
    
}
