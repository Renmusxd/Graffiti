//
//  ViewController.swift
//  Graffiti
//
//  This is an object to display graffiti objects in the world
//  it should use metal or opengl to display the objects at appropriate distance
//  and orientation based on the camera position (acquired by gps and acc)
//  It should also display a camera feed underneath
//
//  Created by Sumner Hearth on 10/15/14.
//  Copyright (c) 2014 RenmusLabs. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let captureSession = AVCaptureSession()
    var previewLayer : AVCaptureVideoPreviewLayer?
    
    // If we find a device we'll store it here for later use
    var captureDevice : AVCaptureDevice?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        captureSession.sessionPreset = AVCaptureSessionPresetLow
        let devices = AVCaptureDevice.devices()
        // Loop through all the capture devices on this phone
        println(devices)
        
        for device in devices {
            // Make sure this particular device supports video
            if (device.hasMediaType(AVMediaTypeVideo)) {
                // Finally check the position and confirm we've got the back camera
                if(device.position == AVCaptureDevicePosition.Back) {
                    captureDevice = device as? AVCaptureDevice
                }
            }
        }
        // Now that we have a video device
        if captureDevice != nil {
            beginSession()
        }
        
        
    }
    
    // Starts a new camera session
    func beginSession(){
        //configureDevice()
        
        var err : NSError? = nil
        captureSession.addInput(AVCaptureDeviceInput(device: captureDevice, error: &err))
        captureSession.sessionPreset = AVCaptureSessionPresetHigh
        if err != nil {
            println("error: \(err?.localizedDescription)")
        }
        
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.view.layer.addSublayer(previewLayer)
        previewLayer?.frame = self.view.layer.frame
        captureSession.startRunning()
    }
    
    // Allows us to control focus of device
    func configureDevice() {
        if let device = captureDevice {
            device.lockForConfiguration(nil)
            device.focusMode = .Locked
            device.unlockForConfiguration()
        }
    }
    
    // Allows manual adjustment of focus
    func focusTo(value : Float) {
        if let device = captureDevice {
            if(device.lockForConfiguration(nil)) {
                device.setFocusModeLockedWithLensPosition(value, completionHandler: { (time) -> Void in
                })
                device.unlockForConfiguration()
            }
        }
    }
    
    // Now manual focusing stuff
    let screenWidth = UIScreen.mainScreen().bounds.size.width
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        var anyTouch = touches.anyObject() as UITouch
        var touchPercent = anyTouch.locationInView(self.view).x / screenWidth
        focusTo(Float(touchPercent))
    }
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        var anyTouch = touches.anyObject() as UITouch
        var touchPercent = anyTouch.locationInView(self.view).x / screenWidth
        focusTo(Float(touchPercent))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

