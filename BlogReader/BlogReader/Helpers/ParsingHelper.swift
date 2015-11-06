//
//  ParsingHelper.swift
//  BlogReader
//
//  Created by Ajay Lalwani on 10/26/15.
//  Copyright © 2015 The Red Voice. All rights reserved.
//

import UIKit

let CATEGORY_KEY = "categories";
let CATEGORY_NAME_KEY = "name";
let CATEGORY_POST_COUNT_KEY = "post_count";
let CATEGORY_SLUG_KEY = "slug";

// POSTS
let POST_ID_KEY = "ID";
let POST_TITLE_KEY = "title";
let POST_CONTENT_KEY = "content";
let POST_ATTACHMENT_KEY = "attachments";
let POST_THUMBNAILS_KEY = "thumbnails";
let POST_THUMBNAIL_KEY = "thumbnail";

class ParsingHelper: NSObject {
    
    
    func parseCategories(data: NSData) {
        do {
            let categories = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary;
            let categoryList = categories[CATEGORY_KEY] as! NSArray;
            
            var categoryInformation: NSDictionary;
            var category: Category;
            
            for i in 0...categoryList.count - 1 {
                categoryInformation = categoryList[i] as! NSDictionary;
                category = Category();
                category.name = (categoryInformation[CATEGORY_NAME_KEY] as! String).uppercaseString;
                category.postCount = categoryInformation[CATEGORY_POST_COUNT_KEY] as! Int;
                category.slug = categoryInformation[CATEGORY_SLUG_KEY] as! NSString as String;
            }
            
        } catch {
            
        }
    }
    
    func parsePosts(data: NSData) {
        do {
            let posts = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary;
            let allPosts = posts["posts"] as! NSArray;
            
            var post: NSDictionary;
            var postID: Int;
            var postAttachments: NSDictionary;
            var postThumbnails: NSDictionary;
            var postThumbnailURL: String;
            var postImages: Array<String>;
            var recentPost: RecentPosts;
            
            for i in 0...allPosts.count - 1 {
                
                recentPost = RecentPosts();
                postImages = Array<String>();
                
                post = allPosts[i] as! NSDictionary;
                postID = post[POST_ID_KEY] as! Int;
                postAttachments = post[POST_ATTACHMENT_KEY] as! NSDictionary;

                recentPost.id = postID;
                recentPost.content = post[POST_CONTENT_KEY] as! String;
                recentPost.title = post[POST_TITLE_KEY] as! String;
                
                for attachmentId in postAttachments.allKeys {
                    
                    postThumbnails = postAttachments[attachmentId as! String] as! NSDictionary;
                    postThumbnails = postThumbnails[POST_THUMBNAILS_KEY] as! NSDictionary;
                    postThumbnailURL = postThumbnails[POST_THUMBNAIL_KEY] as! String;
                    
                    postImages.append(postThumbnailURL);
                }
                recentPost.postAttachments = postImages;
            }
            
        } catch {
            
        }
    }

}
