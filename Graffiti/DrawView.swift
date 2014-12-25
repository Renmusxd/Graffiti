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
    required init(coder aDecoder : NSCoder){
        context = UIGraphicsGetCurrentContext()
        super.init(coder: aDecoder)
    }
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        lastPoint = touches.anyObject()!.locationInView(self)
        
    }

    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        var newPoint = touches.anyObject()!.locationInView(self)
        lines.append(Line(start:lastPoint,end:newPoint))
        lastPoint = newPoint
        self.setNeedsDisplay()
        
    }
    
    
    override func drawRect(rect: CGRect) {
        context = UIGraphicsGetCurrentContext()
        CGContextBeginPath(context)
        for line in lines {
            CGContextMoveToPoint(context, line.start.x, line.start.y)
            CGContextAddLineToPoint(context, line.end.x, line.end.y)
            
        }
        CGContextSetRGBStrokeColor(context, 1,0,0,1)
        CGContextSetLineWidth(context, 2)
        CGContextStrokePath(context)
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
