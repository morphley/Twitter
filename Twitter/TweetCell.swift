//
//  TweetCell.swift
//  Twitter
//
//  Created by Morphley on 22.03.17.
//  Copyright © 2017 Morphley. All rights reserved.
//

import LBTAComponents


class TweetCell: DatasourceCell {
    
    
    override var datasourceItem: Any?{
    
        didSet{
        
            guard let tweet = datasourceItem as? Tweet else { return }

            let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 16)])
            
            let usernameString = " \(tweet.user.username)\n"
            
            attributedText.append(NSAttributedString(string: usernameString, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15), NSForegroundColorAttributeName: UIColor.gray]))
            
            
            //gap betwwen
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            
            let range = NSMakeRange(0, attributedText.string.characters.count)
            attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)
            
            attributedText.append(NSAttributedString(string: tweet.message, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]))
            
                
            messageTextView.attributedText = attributedText
    
//            messageTextView.text = tweet. user.name
//            userNameLabel.text = user.username
//            bioTextView.text  = user.bioText
//            profileImageView.image = user.profileImage
//        
        }
    }
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "@buildThatApp"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(r: 130, g: 130, b: 130)
        return label
    }()
    
    let messageTextView: UITextView = {
        let tv = UITextView()
        tv.text = "Some sample Text"
        tv.backgroundColor = UIColor.white
        return tv
    
    }()
    
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
        addSubview(messageTextView)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
    }

}
