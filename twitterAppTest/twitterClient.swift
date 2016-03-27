//
//  TweetClient.swift
//  twitterAppTest
//
//  Created by jacky nguyen on 3/25/16.
//  Copyright © 2016 jackyCode.com. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class TwitterClient: BDBOAuth1SessionManager {
    
    var loginSuccess : (() -> ())?
    var loginFailure : ((NSError) -> ())?
    
    static let shareInstance = TwitterClient(baseURL: NSURL(string: "https://api.twitter.com")!, consumerKey: "1q9ZuW7Kn9j1GSUctCOO2LZuh", consumerSecret: "TH7jVjkyQcy4Fv62ZOZTPaDVqkkgZ10JsoxYUEFgm8iDM9M1Gu")
    
    func homeTimeLine(success : ([Tweet]) -> (), failure : (NSError) -> ()) {
        GET("1.1/statuses/home_timeline.json", parameters: nil, progress: nil, success: { (task:NSURLSessionDataTask, response:AnyObject?) -> Void in
                let tweets = Tweet.tweetWithArray(response as! [NSDictionary])
                success(tweets)
            }) { (session:NSURLSessionDataTask?, error:
                NSError) -> Void in
                failure(error)
        }
    }
    
    func login(success : () -> (), failure:(NSError) -> ()) {
        loginSuccess = success
        loginFailure = failure
        deauthorize()
        fetchRequestTokenWithPath("oauth/request_token", method: "GET", callbackURL: NSURL(string: "twitterapp://oauth"), scope: nil, success: { (requestToken: BDBOAuth1Credential!) -> Void in
            let url = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken.token)")!
            UIApplication.sharedApplication().openURL(url)
            }) { (error:NSError!) -> Void in
                print(error.localizedDescription)
        }

    }
    
    func currentAccount() {
        GET("1.1/account/verify_credentials.json", parameters: nil, progress: nil, success: { (task:NSURLSessionDataTask, response:AnyObject?) -> Void in
            let user = User(dictionary: (response as? NSDictionary)!)
            print(user)
            }) { (task:NSURLSessionDataTask?, error:NSError) -> Void in
                print(error.localizedDescription)
        }
    }
    
    func openURL(url: NSURL) {
        let requestToken = BDBOAuth1Credential(queryString: url.query)
        fetchAccessTokenWithPath("oauth/access_token", method: "POST", requestToken: requestToken, success: { (accessToken: BDBOAuth1Credential!) -> Void in
                print("i got the access token")
                self.loginSuccess!()
            }) { (error : NSError!) -> Void in
                self.loginFailure?(error)
        }

    }
    
    
}
