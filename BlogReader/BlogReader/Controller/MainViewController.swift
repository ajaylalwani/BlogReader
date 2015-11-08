//
//  MainViewController.swift
//  BlogReader
//
//  Created by Ajay Lalwani on 10/27/15.
//  Copyright © 2015 The Red Voice. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, ConnectionHelperDelegate, ScrollViewHelperDatasource {

    let connectionHelper = ConnectionHelper();
    var scrollViewHelper: ScrollViewHelper?;
    
    var posts = Array<RecentPosts>();
    
    @IBOutlet weak var sideMenu: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        scrollViewHelper = ScrollViewHelper(frame: self.view.bounds);
        self.view.addSubview(scrollViewHelper!);
        scrollViewHelper!.datasource = self;
        scrollViewHelper!.reloadViews();
        
        self.connectionHelper.delegate = self;
        self.connectionHelper.downloadPosts();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    @IBAction func MenuOptionClicked(sender: UIBarButtonItem) {
    }
    
    
    //MARK:- ConnectionHelperDelegate
    func connectionHelper(connectionHelper: ConnectionHelper, didDownloadPost post: RecentPosts) {
        posts.append(post);
        self.scrollViewHelper!.addItemAtIndex(self.posts.count - 1);
    }
    
    //MARK: - ScrollViewHelperDatasource
    func numberOfItemsInScrollView(scrollViewHelper: ScrollViewHelper) -> Int {
        return posts.count;
    }
    
    func postForItemAtIndex(scrollViewHelper: ScrollViewHelper, index: Int) -> RecentPosts {
        return self.posts[index];
    }

}
