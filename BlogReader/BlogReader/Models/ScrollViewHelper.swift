//
//  ScrollViewHelper.swift
//  BlogReader
//
//  Created by Ajay Lalwani on 11/3/15.
//  Copyright © 2015 The Red Voice. All rights reserved.
//

import UIKit

class ScrollViewHelper: UIView {

    let PADDING = 20;
    
    var scrollView = UIScrollView();
    var scrollViewFrame = CGRectZero;
    
    override init(frame: CGRect) {
        scrollViewFrame = frame;
        self.scrollView.frame = scrollViewFrame;
        self.scrollView.pagingEnabled = true;
        super.init(frame: frame);
        self.addSubview(self.scrollView);
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    func reloadViews() {
    
        let totalNumberOfElements = 20;
        var contentView: UIView;

        var totalElementsAdded = 0;
        
        let totalPages = totalNumberOfElements/2 + 1;
        
        self.scrollView.contentSize = CGSizeMake(CGFloat(totalPages) * CGRectGetWidth(self.scrollView.bounds), CGRectGetHeight(self.scrollView.bounds));
        self.backgroundColor = UIColor.colorForScrollViewBackground;
        
        let totalHeightOfContent = CGRectGetHeight(self.scrollView.bounds) - CGFloat(5 * PADDING);
        
        for (var i = 0; i < totalPages; i++) {
            
            if i == 0 {
                contentView = createContentViewWithFrame(CGRectMake(CGFloat(i) * CGRectGetWidth(self.scrollView.bounds) + CGFloat(PADDING), CGFloat(PADDING), CGRectGetWidth(self.scrollView.bounds) - CGFloat(2 * PADDING), totalHeightOfContent));
                contentView.backgroundColor = UIColor.colorForScrollViewCards;
                
                self.scrollView.addSubview(contentView);
                totalElementsAdded++;
                
            } else {
                    contentView = createContentViewWithFrame(CGRectMake(CGFloat(i) * CGRectGetWidth(self.scrollView.bounds) + CGFloat(PADDING), CGFloat(PADDING), CGRectGetWidth(self.scrollView.bounds) - CGFloat(2 * PADDING),totalHeightOfContent/2 - CGFloat(0.5) * CGFloat(PADDING)));
                    contentView.backgroundColor = UIColor.colorForScrollViewCards;
                
                    self.scrollView.addSubview(contentView);
                totalElementsAdded++;
                
                if totalElementsAdded + 1 < totalNumberOfElements  {
                    contentView = createContentViewWithFrame(CGRectMake(CGFloat(i) * CGRectGetWidth(self.scrollView.bounds) + CGFloat(PADDING), totalHeightOfContent/2 + CGFloat(1.5) * CGFloat(PADDING), CGRectGetWidth(self.scrollView.bounds) - CGFloat(2 * PADDING), totalHeightOfContent/2 - CGFloat(PADDING)));
                    contentView.backgroundColor = UIColor.colorForScrollViewCards;
                    
                    self.scrollView.addSubview(contentView);
                    totalElementsAdded++;
                }
            }
        }

    }
    
    
    func createContentViewWithFrame(frame: CGRect) -> UIView {
        let contentView = UIView(frame: frame);
        contentView.backgroundColor = UIColor.colorForScrollViewCards;
        
        // Add Image
        let imageView = UIImageView(frame: CGRectMake(CGFloat(PADDING), CGFloat(PADDING), CGRectGetWidth(frame) - CGFloat(2 * PADDING), CGRectGetHeight(frame) - CGFloat(2 * PADDING)))
        imageView.backgroundColor = UIColor.whiteColor();
        imageView.image = UIImage(named: "Heena");
        imageView.contentMode = UIViewContentMode.ScaleAspectFill;
        imageView.clipsToBounds = true;
        
        
        // Overlay
        let overlayView = UIView(frame: CGRectMake(0, CGRectGetHeight(contentView.bounds) - 200 , CGRectGetWidth(contentView.bounds), 200));
        overlayView.backgroundColor = UIColor.blackColor();
        overlayView.alpha = 0.3;
        
        // MetaView
        let metaView = UIView(frame: overlayView.frame);
        
        // Title
        let lblTitle = UILabel(frame: CGRectMake(0,10, CGRectGetWidth(metaView.bounds), 50));
        lblTitle.text = "The feels of Istanbul";
        lblTitle.textColor = UIColor.whiteColor();
        lblTitle.textAlignment = NSTextAlignment.Center;
        lblTitle.font = UIFont.fontForBlogHeader;
    
        // Partial Content
        let lblContent = UILabel(frame: CGRectMake(30,70, CGRectGetWidth(metaView.bounds) - 60, 90));
        
        //300 Characters maximum
        lblContent.text = "\"The moment’s one of a kind, 39ft above the ground, smack right in the middle of the sky, there’s a picture so perfect that it breaks your heart, in a good way. Seeing the twilight blue horizons blazing in the background, disappearing into a sky full of stars, shining like the perfect little trinkets ...";
        
        lblContent.textColor = UIColor.whiteColor();
        lblContent.font = UIFont.fontForBlogText;
        lblContent.numberOfLines = 4;
        lblContent.lineBreakMode = NSLineBreakMode.ByWordWrapping;
        
        metaView.addSubview(lblTitle);
        metaView.addSubview(lblContent);
        
        contentView.addSubview(imageView);
        contentView.addSubview(overlayView);
        contentView.addSubview(metaView);
        
        return contentView;

    }

}
