//
//  File.swift
//  twitterAppTest
//
//  Created by jacky nguyen on 3/24/16.
//  Copyright © 2016 jackyCode.com. All rights reserved.
//

import UIKit

class User : NSObject {
    
    var name: String?
    var screen_name: String?
    var profile_image_url_https:NSURL?
    var tagline: String?
    
    init(dictionary:NSDictionary) {
        name = dictionary["name"] as? String
        screen_name = dictionary["screen_name"] as? String
        if let profileImage = dictionary["profile_image_url_https"] {
            profile_image_url_https = NSURL(string: profileImage as! String)
        }
        tagline = dictionary["description"] as? String
    }
    
}
