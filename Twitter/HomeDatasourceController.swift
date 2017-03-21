//
//  HomeDatasourceController.swift
//  Twitter
//
//  Created by Morphley on 21.03.17.
//  Copyright © 2017 Morphley. All rights reserved.
//

import LBTAComponents




class HomeDatasource: Datasource {
    
  let words = ["user1","user2","user3"]
    
    //override for numberOfItems
    
    override func numberOfItems(_ section: Int) -> Int {
        return words.count // number of elements in the array
    }
}


class HomeDatasourceController: DatasourceController {
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeDateSource = HomeDatasource()
        self.datasource = homeDateSource // 3 items in my collectionView 
    }
}
