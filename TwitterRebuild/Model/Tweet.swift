//
//  Tweet.swift
//  TwitterRebuild
//
//  Created by RickYip on 16/7/2018.
//  Copyright © 2018年 RickYip. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet {
    let user: User
    let message: String
    
    init(json: JSON) {
        self.user = User(json: json["user"])
        self.message = json["message"].stringValue
    }
}
