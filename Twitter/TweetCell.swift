//
//  TweetCell.swift
//  Twitter
//
//  Created by Morphley on 22.03.17.
//  Copyright © 2017 Morphley. All rights reserved.
//

import LBTAComponents


class TweetCell: DatasourceCell {
    
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "profile_image")
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = UIColor.red
        return imageView // get it inside cell row
    }()
    
    override func setupViews() {
        super.setupViews()
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 130, g: 130, b: 130)
       backgroundColor = UIColor.white
        
        addSubview(profileImageView)
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
    }

}
