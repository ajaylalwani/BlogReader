//
//  ConnectionHelper.swift
//  BlogReader
//
//  Created by Ajay Lalwani on 10/26/15.
//  Copyright © 2015 The Red Voice. All rights reserved.
//

import UIKit

let BASE_URL = "https://public-api.wordpress.com/rest/v1.1/sites/48447328/";
let MENU_ITEM_URI = "categories";
let POSTS_URI = "posts";

protocol ConnectionHelperDelegate {
    
    func connectionHelper(connectionHelper: ConnectionHelper, didDownloadPost post: RecentPosts);
}



class ConnectionHelper: NSObject, ParsingHelperDelegate {
    
    var delegate:ConnectionHelperDelegate?;
    let parsingHelper = ParsingHelper();
    
    override init() {
        super.init();
        self.parsingHelper.delegate = self;
    }
    
    
    func downloadCategories() {
        let session = NSURLSession.sharedSession();
        
        let task = session.dataTaskWithURL(NSURL(string: BASE_URL + MENU_ITEM_URI)!, completionHandler: {
            (data, response, error) in
            
            self.parsingHelper.parseCategories(data!);
            
        });
        
        task.resume();
    }
    
    func downloadPosts() {
        let session = NSURLSession.sharedSession();
        
        let task = session.dataTaskWithURL(NSURL(string: BASE_URL + POSTS_URI)!, completionHandler: {
            (data, response, error) in
            
            self.parsingHelper.parsePosts(data!);
            
        });
        
        task.resume();
    }
    
    //MARK:- ParsingHelperDelegate
    func parsingHelper(parsingHelper: ParsingHelper, didParsePost post: RecentPosts) {
        self.delegate?.connectionHelper(self, didDownloadPost: post);
    }

}
