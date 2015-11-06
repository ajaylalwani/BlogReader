//
//  RecentPosts.swift
//  BlogReader
//
//  Created by Ajay Lalwani on 11/6/15.
//  Copyright © 2015 The Red Voice. All rights reserved.
//

import UIKit

class RecentPosts: NSObject {
    
    var id: Int = 0;
    var title: String?;
    var content: String?;
    var slug: String?;
    var modifiedDate: NSDate?;
    var postAttachments: Array<String>?;

}
