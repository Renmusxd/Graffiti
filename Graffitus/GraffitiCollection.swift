//
//  GraffitiCollection.swift
//  Graffitus
//
//  Created by G Mulitz on 1/2/15.
//  Copyright (c) 2015 Blimp Development. All rights reserved.
//

import UIKit

class GraffitiCollection: UICollectionView {

    var graffitis = [UIImage]()
    
    override func numberOfSections() -> Int {
        return 1
    }
    
    override func numberOfItemsInSection(section: Int) -> Int {
        return graffitis.count
    }
    
    override func cellForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewCell? {
        var cell = dequeueReusableCellWithReuseIdentifier("SingleGraffitiCell", forIndexPath: indexPath) as SingleGraffitiCell
        cell.backgroundColor = UIColor.blackColor()
        return cell
    }
    
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
