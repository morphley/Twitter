//
//  Cells.swift
//  Twitter
//
//  Created by Morphley on 21.03.17.
//  Copyright © 2017 Morphley. All rights reserved.
//

import LBTAComponents


class UserHeader: DatasourceCell{
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = UIColor.blue
    }
    
}


class FooterHeader: DatasourceCell{
    override func setupViews() {
        super.setupViews()
        backgroundColor = UIColor.green
    }
    
}

class UserCell: DatasourceCell {
    override var datasourceItem: Any? {
        didSet{
            nameLabel.text = datasourceItem as? String
        }
    }
    
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.red
        return imageView // get it inside cell row
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Test Test Test"
        label.backgroundColor = UIColor.green
        return label
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.backgroundColor = UIColor.purple
        return label
    }()
    
    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Biotext"
        textView.backgroundColor = UIColor.yellow
        return textView
    }()
    
    let followButton: UIButton = {
    
    let button = UIButton()
        button.backgroundColor = UIColor.cyan
        return button
    
    }()
    
    
    override func setupViews() {
        super.setupViews()
        
        
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(userNameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        userNameLabel.anchor(nameLabel.bottomAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 4, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        bioTextView.anchor(userNameLabel.bottomAnchor, left: userNameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0 , leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        followButton.anchor(topAnchor , left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
   
        
    }
}
