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
        
        // If there is a stored username and passhash, attempt to login
        // if login fails, display screen.
        // else, skip to next view
        if false {
            let vc =
                self.storyboard?.instantiateViewControllerWithIdentifier("Tab Bar Controller") as TabView
                self.presentViewController(vc, animated: true, completion: nil)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        username.endEditing(true)
        password.endEditing(true)
    }
    
    func setupGraffiti (){
        myGraffitiDatabase.setup(username.text, pHash: hash(password.text))
    }
    
    func hash (s : String) -> String {
        return s
    }
    
    @IBOutlet var username : UITextField!
    @IBOutlet var password : UITextField!
    
    @IBOutlet var invalidData : UILabel!
    
    @IBAction func loginButton () {
        let usr = username.text
        let passwd = password.text
        
        // hash password
        
        // send username and password to server for a 24h auth token
        
        // if auth token
        if true {
            // save username and password hash for login later
            /*// navigate to next screen
            let vc =
                self.storyboard?.instantiateViewControllerWithIdentifier("Tab Bar Controller") as TabView
            self.presentViewController(vc, animated: true, completion: nil)*/
            self.performSegueWithIdentifier("loginSegue", sender:nil)
        } else {
            // display warning
            invalidData.hidden = false
            // Clear data
            password.text = ""
        }
    }
    
    @IBAction func registerButton () {
        // Goto registration page of website
        UIApplication.sharedApplication().openURL(NSURL(string: "http://reddit.com")!)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }
    
}
