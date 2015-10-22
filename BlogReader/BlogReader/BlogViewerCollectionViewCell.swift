//
//  BlogViewerCollectionViewCell.swift
//  BlogReader
//
//  Created by Ajay Lalwani on 10/22/15.
//  Copyright © 2015 The Red Voice. All rights reserved.
//

import UIKit

class BlogViewerCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var cellImage: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder);
        
        //self.cellImage.frame = self.bounds;
    }

}
