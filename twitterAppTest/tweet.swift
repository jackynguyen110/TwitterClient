//
//  tweet.swift
//  twitterAppTest
//
//  Created by jacky nguyen on 3/25/16.
//  Copyright © 2016 jackyCode.com. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var text: String?
    var timeStamp: NSDate?
    var retweetcount: Int = 0
    var favoritesCount: Int = 0
    
    init(dictionary: NSDictionary) {
        text = dictionary["dictionary"] as! String?
        let timeStampString = dictionary["created_at"] as! String?
        
        let formater = NSDateFormatter()
        formater.dateFormat = "EEE MM d HH:mm:ss Z y"
        
        timeStamp = formater.dateFromString(timeStampString!)
        
        retweetcount = (dictionary["retweet_count"] as? Int) ?? 0
        favoritesCount = (dictionary["favorites_count"] as? Int) ?? 0
    }
    
    class func tweetWithArray(dictionaries : [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        
        for dictionary in dictionaries {
            var tweet = Tweet(dictionary: dictionary)
            tweets.append(tweet)
        }
    }
 
}



