//
//  TweetsViewController.swift
//  twitterAppTest
//
//  Created by jacky nguyen on 3/26/16.
//  Copyright © 2016 jackyCode.com. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController {
    var tweets :[Tweet]!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TwitterClient.shareInstance.homeTimeLine({ (tweets:[Tweet]) -> () in
            self.tweets = tweets
            for tweet in tweets {
                print(tweet.text)
            }
            }) { (error:NSError) -> () in
                print(error.localizedDescription)
        }
    }
}
