//
//  PathWrapper.swift
//  Graffiti
//
//  Created by G Mulitz on 12/30/14.
//  Copyright (c) 2014 RenmusLabs. All rights reserved.
//

import UIKit


class PathWrapper{
    
    var cPointArray : [[CGPoint]] = []
    var lineWidth : CGFloat = 0
    var lineColor :UIColor = UIColor.clearColor()
    init(){
        
    }
    
    init(spline:[CGPoint]){
        cPointArray += [spline]
    }
    
    func addSpline(spline:[CGPoint]){
        cPointArray += [spline]
    }
    
    
}