//
//  ScrollViewHelper.swift
//  BlogReader
//
//  Created by Ajay Lalwani on 11/3/15.
//  Copyright © 2015 The Red Voice. All rights reserved.
//

import UIKit


protocol ScrollViewHelperDatasource {
    
    func numberOfItemsInScrollView(scrollViewHelper: ScrollViewHelper) -> Int;
    
    func postForItemAtIndex(scrollViewHelper: ScrollViewHelper, index: Int) -> RecentPosts;
}


class ScrollViewHelper: UIView {
    
    let PADDING = 20;
    
    var scrollView = UIScrollView();
    var scrollViewFrame = CGRectZero;
    var datasource: ScrollViewHelperDatasource?
    var totalElementsAdded = 0;
    var currentPage = 0;
    var layoutFlag = true;
    
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
        
        let totalNumberOfElements = (self.datasource?.numberOfItemsInScrollView(self))!;
        totalElementsAdded = 0;
        
        if totalNumberOfElements < 1 {
            return;
        }
        
        self.scrollView.subviews.forEach({ $0.removeFromSuperview() });
        
        self.backgroundColor = UIColor.colorForScrollViewBackground;
        
        let totalPages = totalNumberOfElements/2 + 1;
        
        for (var i = 0; i < totalPages; i++) {
            
            addItemAtIndex(i);
            
        }
        
    }
    
    func addItemAtIndex(i: Int) {
        
        var contentView: UIView;
        var post: RecentPosts?;
        
        let totalHeightOfContent = CGRectGetHeight(self.scrollView.bounds) - CGFloat(5 * PADDING);
        
        let totalNumberOfElements = (self.datasource?.numberOfItemsInScrollView(self))!;
        let totalPages = totalNumberOfElements/2 + 1;
        
        self.scrollView.contentSize = CGSizeMake(CGFloat(totalPages) * CGRectGetWidth(self.scrollView.bounds), CGRectGetHeight(self.scrollView.bounds));
        
        if i == 0 {
            post = self.datasource?.postForItemAtIndex(self, index: totalElementsAdded);
            
            contentView = createContentViewWithFrame(CGRectMake(CGFloat(currentPage) * CGRectGetWidth(self.scrollView.bounds) + CGFloat(PADDING), CGFloat(PADDING), CGRectGetWidth(self.scrollView.bounds) - CGFloat(2 * PADDING), totalHeightOfContent), andPost: post!);
            contentView.backgroundColor = UIColor.colorForScrollViewCards;
            
            self.scrollView.addSubview(contentView);
            totalElementsAdded++;
            currentPage++;
            
        } else {
            
            if layoutFlag {
                post = self.datasource?.postForItemAtIndex(self, index: totalElementsAdded);
                contentView = createContentViewWithFrame(CGRectMake(CGFloat(currentPage) * CGRectGetWidth(self.scrollView.bounds) + CGFloat(PADDING), CGFloat(PADDING), CGRectGetWidth(self.scrollView.bounds) - CGFloat(2 * PADDING),totalHeightOfContent/2 - CGFloat(0.5) * CGFloat(PADDING)), andPost: post!);
                contentView.backgroundColor = UIColor.colorForScrollViewCards;
                
                self.scrollView.addSubview(contentView);
                totalElementsAdded++;
                layoutFlag = !layoutFlag;
            } else {
                
                post = self.datasource?.postForItemAtIndex(self, index: totalElementsAdded);
                contentView = createContentViewWithFrame(CGRectMake(CGFloat(currentPage) * CGRectGetWidth(self.scrollView.bounds) + CGFloat(PADDING), totalHeightOfContent/2 + CGFloat(1.5) * CGFloat(PADDING), CGRectGetWidth(self.scrollView.bounds) - CGFloat(2 * PADDING), totalHeightOfContent/2 - CGFloat(PADDING)), andPost: post!);
                contentView.backgroundColor = UIColor.colorForScrollViewCards;
                
                self.scrollView.addSubview(contentView);
                totalElementsAdded++;
                layoutFlag = !layoutFlag;
                currentPage++;
            }
        }
    }
    
    func createContentViewWithFrame(frame: CGRect, andPost post: RecentPosts) -> UIView {
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
        let lblTitle = UILabel(frame: CGRectMake(0,10, CGRectGetWidth(metaView.bounds), 30));
        lblTitle.text = post.title!.html2String;
        lblTitle.textColor = UIColor.whiteColor();
        lblTitle.textAlignment = NSTextAlignment.Center;
        lblTitle.font = UIFont.fontForBlogHeader;
        
        // Partial Content
        let lblContent = UILabel(frame: CGRectMake(30,40, CGRectGetWidth(metaView.bounds) - 60, 90));
        
        //300 Characters maximum
        let postContent = post.content?.html2String;
        let index = postContent!.startIndex.advancedBy(300);
        let finalPostContent = postContent!.substringToIndex(index);
        lblContent.text = "\(finalPostContent)...";
        
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
