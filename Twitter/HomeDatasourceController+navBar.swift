//
//  HomeDatasourceController+navBar.swift
//  Twitter
//
//  Created by Morphley on 22.03.17.
//  Copyright © 2017 Morphley. All rights reserved.
//

import UIKit

extension HomeDatasourceController{




    func setupNavigationBarItems(){
        setupRightNavitems()
        setupLeftNavItem()
        setupRemainingNavItem()
    }
    
    
     func setupRemainingNavItem(){
        
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
        //bird is too big must be shrinked down
        titleImageView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        
        
        navigationController?.navigationBar.backgroundColor = UIColor.white
        navigationController?.navigationBar.isTranslucent = false
        
        
    }
     func setupLeftNavItem(){
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
    
    
     func setupRightNavitems(){
        
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composeButton),UIBarButtonItem(customView: searchButton)] // array goes left to right
    }
    





}
