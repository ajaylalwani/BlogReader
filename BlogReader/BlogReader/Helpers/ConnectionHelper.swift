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

let parsingHelper = ParsingHelper();

class ConnectionHelper: NSObject {
    
    func downloadCategories() {
        let session = NSURLSession.sharedSession();
        
        let task = session.dataTaskWithURL(NSURL(string: BASE_URL + MENU_ITEM_URI)!, completionHandler: {
            (data, response, error) in
            
            parsingHelper.parseCategories(data!);
            
        });
        
        task.resume();
    }
    
    func downloadPosts() {
        let session = NSURLSession.sharedSession();
        
        let task = session.dataTaskWithURL(NSURL(string: BASE_URL + POSTS_URI)!, completionHandler: {
            (data, response, error) in
            
            parsingHelper.parsePosts(data!);
            
        });
        
        task.resume();
    }

}
