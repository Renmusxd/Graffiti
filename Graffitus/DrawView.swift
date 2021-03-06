//
//  DrawView.swift
//  Graffiti
//
//  Created by G Mulitz on 12/25/14.
//  Copyright (c) 2014 RenmusLabs. All rights reserved.
//

import UIKit


class DrawView: UIView {
    
    
    /*TODO
    OPTIMIZATION: allocate background threads to update cache
    draw text?
    paint bucket?
    */
    
    
    var cachedImage : UIImage
    var path : UIBezierPath
    var cPoints : [CGPoint] = []
    var idx = 0
    
    var lineColor = UIColor.blackColor()
    var lineWidth : CGFloat = 2.0;
    
    var pathStack : [PathWrapper] = []
    
    required init(coder aDecoder : NSCoder){
        path = UIBezierPath()
        cachedImage = UIImage()
        
        super.init(coder: aDecoder)
        
        self.multipleTouchEnabled = false
        self.backgroundColor = UIColor.whiteColor()
        
        path.lineWidth = lineWidth;
        path.lineCapStyle = kCGLineCapRound
        
        
        
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, true, 1.0)
        var rectpath = UIBezierPath(rect: self.bounds)
        UIColor.whiteColor().setFill()
        //UIColor.clearColor()
        cachedImage.drawAtPoint(CGPointZero)
        rectpath.fill()
        
        cachedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
    }
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        var lastPoint = touches.anyObject()!.locationInView(self)
        idx = 0
        cPoints = [lastPoint]
        
        
        
    }

    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        var newPoint = touches.anyObject()!.locationInView(self)
        
        idx++
        
        cPoints += [newPoint]
        
        if(idx == 4){
            
            var smoothMid = CGPointMake((cPoints[2].x + cPoints[4].x)/2, (cPoints[2].y + cPoints[4].y)/2)
            var last = cPoints[4]
            path.moveToPoint(cPoints[0])
            path.addCurveToPoint(smoothMid, controlPoint1: cPoints[1], controlPoint2: cPoints[2])
            
            
            self.setNeedsDisplay()
            
            cPoints = [smoothMid,last]
            idx = 1
        }
        
        
        
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        
        self.drawBitmap(cPoints.count == 1)
        self.setNeedsDisplay()
        
        self.addPathToStack(path)
        
        path.removeAllPoints()
        idx = 0
    }
    
    override func touchesCancelled(touches: NSSet!, withEvent event: UIEvent!) {
        touchesEnded(touches, withEvent: event)
    }
    
    func drawBitmap(isPoint:Bool){
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, true, 0)
        lineColor.setStroke()
        cachedImage.drawAtPoint(CGPointZero)
        if(isPoint){
            path.moveToPoint(cPoints[0])
            path.addLineToPoint(cPoints[0])
            
            path.stroke()
        }
        else{
            path.stroke()
        }

        cachedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    override func drawRect(rect: CGRect) {
        cachedImage.drawInRect(rect, blendMode: kCGBlendModeNormal, alpha: 1.0)
        lineColor.setStroke()
        path.stroke()
    }
    
    
    func changeColor(newHue:CGFloat){
        lineColor = UIColor(hue: newHue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
    }
    
    func changeWidth(newWidth:CGFloat){
        lineWidth = newWidth;
        path.lineWidth = lineWidth;
    }
    
    
    func undoLastDraw(){
        if(pathStack.count > 0){
            pathStack.removeLast()
            reDrawCache()
            
            
            self.setNeedsDisplay()
            
        }
    }
    
    
    
    
    func reDrawCache(){
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, true, 0)
        //reset to white
        var rectpath = UIBezierPath(rect: self.bounds)
        UIColor.whiteColor().setFill()
        //UIColor.clearColor()
        cachedImage.drawAtPoint(CGPointZero)
        rectpath.fill()
        
        //draw all lines
        
        
        for pathWrap in pathStack{
            pathWrap.draw()
        }
        
        path.lineWidth = lineWidth
        cachedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
    }
    
    func addPathToStack(bpath:UIBezierPath){
        var pathWrapper = PathWrapper()
        
        pathWrapper.addSpline(UIBezierPath(CGPath: bpath.CGPath))
        pathWrapper.lineWidth = lineWidth
        pathWrapper.lineColor = lineColor
        pathWrapper.lineCapStyle = path.lineCapStyle
        pathStack += [pathWrapper]
    }
    

}
