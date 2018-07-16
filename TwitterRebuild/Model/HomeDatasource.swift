//
//  HomeDatasource.swift
//  TwitterRebuild
//
//  Created by RickYip on 15/7/2018.
//  Copyright © 2018年 RickYip. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    
    let users: [User] = {
        let trumpUser = User(name: "Donald J. Trump", username: "@realdonaldtrump", bioText: "45th President of the United States of America🇺🇸", profileImage: #imageLiteral(resourceName: "trump"))
        let whitehouseUser = User(name: "The White House", username: "@WhiteHouse", bioText: "Welcome to @WhiteHouse! Follow for the latest from President @realDonaldTrump and his Administration. Tweets may be archived: http://whitehouse.gov/privacy ", profileImage: #imageLiteral(resourceName: "whitehouse"))
        let germanyUser = User(name: "Germany", username: "@dfb_team_en", bioText: "#DieMannschaft in English 🇩🇪🇬🇧 News from the Germany national teams & DFB! DE: @DFB_Team | ES: @DFB_Team_ES Imprint: https://www.dfb.de/en/misc/imprint/ …", profileImage: #imageLiteral(resourceName: "germanyt"))
        return [trumpUser, whitehouseUser, germanyUser]
    }()
    
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
