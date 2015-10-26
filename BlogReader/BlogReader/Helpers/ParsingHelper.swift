//
//  ParsingHelper.swift
//  BlogReader
//
//  Created by Ajay Lalwani on 10/26/15.
//  Copyright © 2015 The Red Voice. All rights reserved.
//

import UIKit

let CATEGORY_KEY = "categories"
let CATEGORY_NAME_KEY = "name"
let CATEGORY_POST_COUNT_KEY = "post_count"
let CATEGORY_SLUG_KEY = "slug"

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

}
