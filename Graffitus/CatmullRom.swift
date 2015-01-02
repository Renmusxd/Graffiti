//
//  CatmullRom.swift
//  Graffiti
//
//  Created by G Mulitz on 12/29/14.
//  Copyright (c) 2014 RenmusLabs. All rights reserved.
//

import UIKit

class CatmullRom{
    var p0 = CGPointZero
    var p1 = CGPointZero
    var p2 = CGPointZero
    var p3 = CGPointZero
    var t0 : CGVector{
        get{
            return normalizeVector(CGVectorMake((p2.x - p0.x)/2, (p2.y - p0.y)/2 ))
        }
    }
    var t1 : CGVector{
        get{
            return normalizeVector(CGVectorMake((p3.x - p1.x)/2, (p3.y - p1.y)/2 ))
        }
    }
    
    func normalizeVector(vec2:CGVector) -> CGVector{
        
        var length = sqrt(vec2.dx*vec2.dx + vec2.dy*vec2.dy)
        if(length==0){
            return CGVectorMake(0, 0)
        }
        
        return CGVectorMake(vec2.dx/length,
            vec2.dy/length)
        
        
    }
    
    init(points:[CGPoint]){
        print(points.count)
        switch(points.count){
        case 1:
            p0 = points[0]
            p1 = p0
            p2 = p0
            p3 = p0
        case 2:
            p0 = points[0]
            p3 = points[1]
            p2 = p3
            p1 = p0
            
        
        case 4:
            p0 = points[0]
            p1 = points[1]
            p2 = points[2]
            p3 = points[3]
        default:
            p0 = CGPointZero
            p1 = CGPointZero
            p2 = CGPointZero
            p3 = CGPointZero
        }
    }
    
    //Outputs the four control points for a
    //bezier spline segment. This is the
    //"middle" part of the Catmull-Rom and
    //should be sufficient when chaining
    
    //start, tangent, -tangent, end
    func convertToBezier() ->[CGPoint] {
        var cPoints : [CGPoint] = []
        var tangent1 = CGPointMake(3*t0.dx + p1.x,3*t0.dy + p1.y)
        var tangent2 = CGPointMake(-3*t1.dx + p2.x, -3*t1.dy + p2.y)
        cPoints += [p1,tangent1,tangent2,p2]
        return cPoints
        
    }
    
}