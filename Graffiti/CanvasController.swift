//
//  CanvasController.swift
//  Graffiti
//
//  Created by G Mulitz on 12/25/14.
//  Copyright (c) 2014 RenmusLabs. All rights reserved.
//

import UIKit

class CanvasController: UIViewController {

    @IBOutlet weak var drawView: DrawView!
    
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var useButton: UIButton!
    
    @IBOutlet weak var widthControl: UISlider!
    
    @IBOutlet weak var colorControl: UISlider!
    
    @IBOutlet weak var undoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //strange thing I have to do to get 
        //the drawer to behave properly on the first swipe
        //just simulates a tap
        var fucker = NSMutableSet()
        fucker.addObject(UITouch())
        touchesBegan(fucker, withEvent: UIEvent())
        touchesEnded(fucker, withEvent: UIEvent())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.hideControls()
        
        drawView.touchesBegan(touches, withEvent: event)
        
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        drawView.touchesMoved(touches, withEvent: event)
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        self.showControls()
        drawView.touchesEnded(touches, withEvent: event)
    }
    
    @IBAction func saveImage(sender: AnyObject) {
    }
    
    @IBAction func useDrawnImage(sender: AnyObject) {
    }
    
    
    
    @IBAction func widthSlider(sender: UISlider) {
        drawView.changeWidth(CGFloat(sender.value)*6+1)
    }
    
    @IBAction func colorSlider(sender: UISlider) {
        drawView.changeColor(CGFloat(sender.value))
    }
    

    @IBAction func undoDraw(sender: AnyObject) {
        drawView.undoLastDraw()
    }
    
    
    
    func hideControls(){
        saveButton.hidden = true;
        useButton.hidden = true;
        widthControl.hidden = true;
        colorControl.hidden = true;
        undoButton.hidden = true;
        
    }
    
    func showControls(){
        saveButton.hidden = false;
        useButton.hidden = false;
        widthControl.hidden = false;
        colorControl.hidden = false;
        undoButton.hidden = false;
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
