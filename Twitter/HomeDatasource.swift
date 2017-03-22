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
                             bioText: "whats up", profileImage: #imageLiteral(resourceName: "profile_image"))
   
        return [suloUser,ehsanUser]
    }()
    
    
  //  let words = ["user1", "user2", "user3"]
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [FooterHeader.self]
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
