//
//  ViewController.swift
//  BlogReader
//
//  Created by Ajay Lalwani on 10/22/15.
//  Copyright © 2015 The Red Voice. All rights reserved.
//

import UIKit

let OVERLAY_HEIGHT = 250;

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var blogCollectionView: UICollectionView!
    
    
    let connectionHelper = ConnectionHelper();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.blogCollectionView.frame = self.view.bounds;
        self.connectionHelper.downloadCategories();
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("BlogCell", forIndexPath: indexPath);
        
        // Background Image
        let imageView = UIImageView(image: UIImage(named: "Heena"));
        imageView.frame = cell.bounds;
        imageView.contentMode = UIViewContentMode.ScaleAspectFill;
        cell.addSubview(imageView);
        
        // Text Overlay
        let overlayView = UIView();
        
        //if indexPath.row == 0 {
            overlayView.frame = CGRectMake(0, CGRectGetHeight(cell.bounds) - CGFloat(OVERLAY_HEIGHT), CGRectGetWidth(cell.bounds), CGFloat(OVERLAY_HEIGHT));
        //} else {
          //  overlayView.frame = CGRectMake(CGRectGetWidth(cell.bounds) - CGFloat(OVERLAY_HEIGHT), 0, CGFloat(OVERLAY_HEIGHT), CGRectGetHeight(cell.bounds));
        //}
        
        
        
        
        overlayView.backgroundColor = UIColor.whiteColor();
        overlayView.alpha = 0.5;
        
        cell.addSubview(overlayView);
        
        return cell;
    }
    
    
    //MARK: - UICollectionViewDelegateFlowLayout
    
    /*
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

        let viewWidth = CGRectGetWidth(self.view.bounds);
        let viewHeight = CGRectGetHeight(self.view.bounds);
        
        if indexPath.row == 0 {
            return CGSizeMake(viewWidth, viewHeight)
        //} else if indexPath.row > 2 {
        //    return CGSizeMake(viewWidth/2, viewHeight/2)
        } else { //if indexPath.row == 1 || indexPath.row == 2{
            return CGSizeMake(viewWidth, viewHeight/2)
        }
        
        //return CGSizeMake(viewWidth, viewHeight);
    }
    */
    
}

