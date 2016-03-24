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
        let twiterClient = BDBOAuth1SessionManager(baseURL: NSURL(string: "https://api.twitter.com")!, consumerKey: "1q9ZuW7Kn9j1GSUctCOO2LZuh", consumerSecret: "TH7jVjkyQcy4Fv62ZOZTPaDVqkkgZ10JsoxYUEFgm8iDM9M1Gu")
        
        twiterClient.deauthorize()
        twiterClient.fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: nil, scope: nil, success: { (requestToken: BDBOAuth1Credential!) -> Void in
            print("i got a token")
            let url = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")!
            UIApplication.sharedApplication().openURL(url)
            }) { (error:NSError!) -> Void in
                print(error.localizedDescription)
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

