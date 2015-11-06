//
//  MainViewController.swift
//  BlogReader
//
//  Created by Ajay Lalwani on 10/27/15.
//  Copyright © 2015 The Red Voice. All rights reserved.
//

import UIKit

class MainViewController: UIViewController{

    let connectionHelper = ConnectionHelper();
    
    @IBOutlet weak var sideMenu: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        let scrollViewHelper = ScrollViewHelper(frame: self.view.bounds);
        self.view.addSubview(scrollViewHelper);
        scrollViewHelper.reloadViews();
        
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

}
