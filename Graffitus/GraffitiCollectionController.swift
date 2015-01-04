//
//  GraffitiCollectionController.swift
//  Graffitus
//
//  Created by G Mulitz on 1/3/15.
//  Copyright (c) 2015 Blimp Development. All rights reserved.
//

import UIKit
import CoreData

class GraffitiCollectionController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    
    @IBOutlet var collectionView: UICollectionView!
    
    
    var graffitiArray : [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let appDel : AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        let context : NSManagedObjectContext = appDel.managedObjectContext!
        
        let req =  NSFetchRequest(entityName: "ImageData")
        
        req.returnsObjectsAsFaults = false
        
        var results = context.executeFetchRequest(req, error: nil)!
        
        
        for result in results{
            var temp = result as ImageData
            var imageData : NSData = temp.imageData
            var image = UIImage(data: imageData)!
            graffitiArray += [image]
        }
        
        collectionView.registerClass(GraffitiViewCell.classForCoder(), forCellWithReuseIdentifier: "GraffitiViewCell")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return graffitiArray.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell =  collectionView.dequeueReusableCellWithReuseIdentifier("GraffitiViewCell", forIndexPath: indexPath) as GraffitiViewCell
        
        var image = graffitiArray[indexPath.row]
        cell.backgroundView = UIImageView(image: image)
        cell.changeImage(image)
        
        
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
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
