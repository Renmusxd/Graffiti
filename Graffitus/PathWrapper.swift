//
//  PathWrapper.swift
//  Graffiti
//
//  Created by G Mulitz on 12/30/14.
//  Copyright (c) 2014 RenmusLabs. All rights reserved.
//

import UIKit


class PathWrapper{
    
    var path : UIBezierPath = UIBezierPath()
    var lineWidth : CGFloat = 0
    var lineColor :UIColor = UIColor.clearColor()
    var lineCapStyle : CGLineCap = kCGLineCapRound
    init(){
        
    }
    
    init(spline:UIBezierPath){
        path = spline
    }
    
    
    func addSpline(spline:UIBezierPath){
        path = spline
    }
    
    func draw(){
        lineColor.setStroke()
        path.lineWidth = lineWidth
        path.lineCapStyle = lineCapStyle
        path.stroke()
    }
    

    
}