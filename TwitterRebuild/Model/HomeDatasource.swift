//
//  HomeDatasource.swift
//  TwitterRebuild
//
//  Created by RickYip on 15/7/2018.
//  Copyright © 2018年 RickYip. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasource: Datasource, JSONDecodable {
    
    let users: [User]
    let tweets: [Tweet]
    
    required init(json: JSON) throws {
        guard let userJsonArray = json["users"].array, let tweetJsonArray = json["tweets"].array else {
            throw NSError(domain: "com.yipkaming.TwitterRebuild",
                          code: 1,
                          userInfo: [NSLocalizedDescriptionKey: "JSON format is not valid"])
        }

        self.users = userJsonArray.map {
            // map return array of user, $0 is the json object inside of the array
            User(json: $0)
        }
        self.tweets = tweetJsonArray.map {
            Tweet(json: $0)
        }
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        // each section has a diff class of cell
        return [UserCell.self, TweetCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
}
