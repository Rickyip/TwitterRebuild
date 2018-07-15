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
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
}
