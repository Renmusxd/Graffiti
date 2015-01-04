//
//  GraffitiViewCell.swift
//  Graffitus
//
//  Created by G Mulitz on 1/3/15.
//  Copyright (c) 2015 Blimp Development. All rights reserved.
//

import UIKit

class GraffitiViewCell: UICollectionViewCell {
    
    
    var imageView : UIImageView
    
    
    override init(frame: CGRect) {
        imageView = UIImageView(frame: frame)
        super.init(frame: frame)
        
    }

    required init(coder aDecoder: NSCoder) {
        imageView = UIImageView(frame: CGRectMake(0, 0, 200, 200))
        super.init(coder: aDecoder)
        
    }
    
    
    func changeImage(image:UIImage){
        imageView.image = image
    }
    
}
