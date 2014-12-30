//
//  DrawView.swift
//  Graffiti
//
//  Created by G Mulitz on 12/25/14.
//  Copyright (c) 2014 RenmusLabs. All rights reserved.
//

import UIKit


class DrawView: UIView {
    
    var lines : [Line] = []
    var lastPoint : CGPoint!
    var context : CGContext!
    var splines : [CatmullRom] = []
    var points : [CGPoint] = []
    
    var cachedImage : UIImage
    var path : UIBezierPath
    
    
    required init(coder aDecoder : NSCoder){
        path = UIBezierPath()
        cachedImage = UIImage()
        
        super.init(coder: aDecoder)
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, true, 1.0)
        var rectpath = UIBezierPath(rect: self.bounds)
        UIColor.whiteColor().setFill()
        rectpath.fill()
        cachedImage.drawAtPoint(CGPointZero)
        cachedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        lastPoint = touches.anyObject()!.locationInView(self)
        path.moveToPoint(lastPoint)
//        points = [lastPoint]
        
    }

    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        var newPoint = touches.anyObject()!.locationInView(self)
        
        //lines.append(Line(start:lastPoint,end:newPoint))
        
        /*
        var count = points.count
        if(count < 4){
            var controls = Array(points[0...(count-1)])
            splines.append(
                CatmullRom(points: controls)
            )
        }
        else{
            var controls = Array(points[count-4...count-1])
            splines.append(
                CatmullRom(points: controls)
            )
        }
        */
        //lastPoint = newPoint
        
        //points += [lastPoint]
        
        path.addLineToPoint(newPoint)
        
        self.setNeedsDisplay()
        
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        var p = touches.anyObject()!.locationInView(self)
        path.addLineToPoint(p)
        self.drawBitmap()
        self.setNeedsDisplay()
        path.removeAllPoints()
    }
    
    override func touchesCancelled(touches: NSSet!, withEvent event: UIEvent!) {
        touchesEnded(touches, withEvent: event)
    }
    
    func drawBitmap(){
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, true, 0)
        UIColor.blackColor().setStroke()
        cachedImage.drawAtPoint(CGPointZero)
        path.stroke()
        cachedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    override func drawRect(rect: CGRect) {
        context = UIGraphicsGetCurrentContext()
        CGContextBeginPath(context)
        
        
        cachedImage.drawInRect(rect, blendMode: kCGBlendModeNormal, alpha: 1.0)
        path.stroke()
        
        
        
        /*
        for line in lines {
            CGContextMoveToPoint(context, line.start.x, line.start.y)
            CGContextAddLineToPoint(context, line.end.x, line.end.y)
        }
        */
        
        /*
        for curve in splines{
            var cPoints = curve.convertToBezier()
            
            var start = cPoints[0]
            var cp1 = cPoints[1]
            var cp2 = cPoints[2]
            var end = cPoints[3]
            print(cp1)
            CGContextMoveToPoint(context, start.x, start.y)
            
            CGContextAddCurveToPoint(context, cp1.x, cp1.y, cp2.x, cp2.y, end.x, end.y)
        }
        */
        
       
        
        /*
        CGContextSetRGBStrokeColor(context, 1,0,0,1)
        CGContextSetLineCap(context, kCGLineCapRound)
        CGContextSetLineWidth(context, 2)
        CGContextStrokePath(context)
        CGContextClosePath(context)
        */
    

    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}