//
//  HomeDatasourceController+Navbar.swift
//  TwitterRebuild
//
//  Created by RickYip on 15/7/2018.
//  Copyright © 2018年 RickYip. All rights reserved.
//

import UIKit

extension HomeDatasourceController {
    
    func setupNavigationBarItems() {
        setupRightNavItems()
        setupLeftNavItems()
        setupRemainingNavItems()
    }
    
    private func setupRemainingNavItems() {
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        navigationController?.navigationBar.backgroundColor = .white
        // to make it purely white instead of having the default light color
        navigationController?.navigationBar.isTranslucent = false
    }
    
    private func setupLeftNavItems() {
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
    private func setupRightNavItems(){
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        //if you have the color, you can do this to make the image color to be what you want
        //        composeButton.tintColor = twitterBlue
        
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composeButton), UIBarButtonItem(customView: searchButton)]
    }
}
