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
    
    required init(json: JSON) throws {
        
        var users = [User]()
        
        let array = json["users"].array
        
        for userjson in array! {
            let name = userjson["name"].stringValue
            let username = userjson["username"].stringValue
            let bio = userjson["bio"].stringValue
            
            let user = User(name: name, username: username, bioText: bio, profileImage: UIImage())
            users.append(user)
        }
        self.users = users
        print("Json init, having \(users.count) users")
    }
    
    let tweets: [Tweet] = {
        let trumpUser = User(name: "Donald J. Trump", username: "@realdonaldtrump", bioText: "45th President of the United States of America🇺🇸", profileImage: #imageLiteral(resourceName: "trump"))
        let tweet1 = Tweet(user: trumpUser, message: "Our relationship with Russia has NEVER been worse thanks to many years of U.S. foolishness and stupidity and now, the Rigged Witch Hunt!")
        let tweet2 = Tweet(user: trumpUser, message: "President Obama thought that Crooked Hillary was going to win the election, so when he was informed by the FBI about Russian Meddling, he said it couldn’t happen, was no big deal, & did NOTHING about it. When I won it became a big deal and the Rigged Witch Hunt headed by Strzok!")
        return [tweet1, tweet2]
    }()
    
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
