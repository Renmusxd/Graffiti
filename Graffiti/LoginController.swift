//
//  LoginController.swift
//  Graffiti
//
//  Created by Sumner Hearth on 10/16/14.
//  Copyright (c) 2014 RenmusLabs. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
   
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColorFromRGB(0x8C0606)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet var username : UITextField!
    @IBOutlet var password : UITextField!
    
    @IBOutlet var invalidData : UILabel!
    
    @IBAction func loginButton () {
        if true {
            let vc =
                self.storyboard?.instantiateViewControllerWithIdentifier("Tab Bar Controller") as TabView
            self.presentViewController(vc, animated: true, completion: nil)
        } else {
            invalidData.hidden = false
        }
    }
    
    @IBAction func registerButton () {
        UIApplication.sharedApplication().openURL(NSURL(string: "http://reddit.com"))
    }
    
}
