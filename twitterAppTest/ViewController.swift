//
//  ViewController.swift
//  twitterAppTest
//
//  Created by DEREK DO on 24/3/16.
//  Copyright © 2016 jackyCode.com. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
           }

    @IBAction func onLoginTapped(sender: AnyObject) {
        TwitterClient.shareInstance.login({ () -> () in
            print("i've logged in")
            //self.performSegueWithIdentifier("loginsegue", sender: nil)
            }) { (error:NSError) -> () in
                print(error.localizedDescription)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

