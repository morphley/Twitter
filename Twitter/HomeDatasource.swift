//
//  HomeDatasource.swift
//  Twitter
//
//  Created by Morphley on 21.03.17.
//  Copyright © 2017 Morphley. All rights reserved.
//

import LBTAComponents



class HomeDatasource: Datasource {
    
    let users: [User]={
    
        let suloUser = User(name: "Süleyman", username: "@sulo",
                            bioText: "Whats up", profileImage: #imageLiteral(resourceName: "profile_image") )
        
        let ehsanUser = User(name: "Ehsan!", username: "@ehsan",
                             bioText: "whats up hey heyh ey hey whats up hey heyh ey hey whats up hey heyh ey hey whats up hey heyh ey hey whats up hey heyh ey hey whats up hey heyh ey hey whats up hey heyh ey hey whats up hey heyh ey hey whats up hey heyh ey hey whats up hey heyh ey hey  ", profileImage: #imageLiteral(resourceName: "profile_image"))
   
        
        let laylaUser = User(name: "Layla!", username: "@Layla",
                             bioText: "whats up hey heyh ey hey whats up hey heyh ey hey whats up hey heyh ey hey whats up hey heyh ey hey whats up hey heyh ey hey whats up hey heyh ey hey whats up hey heyh ey hey whats up hey heyh ey hey whats up hey heyh ey hey whats up hey heyh ey hey  ", profileImage: #imageLiteral(resourceName: "profile_image"))
        
        let essaakUser = User(name: "Essaak!", username: "@Essaak",
                             bioText: "whats up hey heyh  ", profileImage: #imageLiteral(resourceName: "profile_image"))
        
        return [suloUser,ehsanUser,laylaUser, essaakUser]
    }()
    
    
  //  let words = ["user1", "user2", "user3"]
  //  let tweets = ["teweet1", "tweet2"]
    
    let tweets: [Tweet] = { 
        
        let userSulo = User(name: "Sulo", username: "@Sulo", bioText: "Sulo", profileImage: #imageLiteral(resourceName: "profile_image"))
        
        let tweetSulo = Tweet(user: userSulo, message: "Whats up dude")
    
        let userEhsan = User(name: "Sulo", username: "@Sulo", bioText: "Sulo", profileImage: #imageLiteral(resourceName: "profile_image"))
        
        let tweetEhsan = Tweet(user: userSulo, message: "Whats up dude")
        
        return [ tweetSulo, tweetEhsan]
    }()
    
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [FooterHeader.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        
        if indexPath.section == 1{
        
        return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    //add a second section and try to delete the header and footer
    override func numberOfSections() -> Int {
        return 2
    }
    
    
    override func numberOfItems(_ section: Int) -> Int {
        
        if section == 1 {
        return tweets.count
        }
        return users.count
    }
    
}
