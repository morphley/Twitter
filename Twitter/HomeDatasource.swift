//
//  HomeDatasource.swift
//  Twitter
//
//  Created by Morphley on 21.03.17.
//  Copyright © 2017 Morphley. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON



class HomeDatasource: Datasource, JSONDecodable{
    
    
        let users: [User]
        
        required init(json: JSON) throws {
            // print("Now ready to parse json: \n", json)
            
            var users = [User]()
            
            let array = json["users"].array
            for userJson in array! {
                let name = userJson["name"].stringValue
                let username = userJson["username"].stringValue
                let bio = userJson["bio"].stringValue
                
                let user = User(name: name, username: username, bioText: bio, profileImage: UIImage())
                
                //  print(userJson["name"].stringValue)
                
                print(user.username)
                users.append(user)
                
            }
            self.users = users
            
        }
   
    
    
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
