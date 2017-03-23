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
        tv.backgroundColor = UIColor.clear
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
    
    //Create the system-button and set the image
    let replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "reply").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    let reTweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "retweet").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
 
    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "like").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    
    let directMessageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "send_message").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 130, g: 130, b: 130)
       backgroundColor = UIColor.white
        
        addSubview(profileImageView)
        addSubview(messageTextView)
      //  addSubview(replyButton)
       // addSubview(reTweetButton)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        
//        replyButton.anchor(nil, left: messageTextView.leftAnchor, bottom: self.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
//        
//        reTweetButton.anchor(nil, left: replyButton.leftAnchor, bottom: self.bottomAnchor, right: nil, topConstant: 0, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
//        
//        
    
        setupBottomButtons()
        
    }
    
    
    fileprivate func setupBottomButtons(){
        let replyButtonContainverView = UIView()
//        replyButtonContainverView.backgroundColor = UIColor.red
        
        let retweetButtonContainverView = UIView()
//        retweetButtonContainverView.backgroundColor = UIColor.blue
        
        let likeButtonContainerView = UIView()
        //likeButtonContainerView.backgroundColor = UIColor.green
        
        let directMessageContainerView = UIView()
//        directMessageContainerView.backgroundColor = UIColor.purple
        
      
        let buttonsStackView = UIStackView(arrangedSubviews: [replyButtonContainverView, retweetButtonContainverView, likeButtonContainerView, directMessageContainerView])
        buttonsStackView.axis = .horizontal
        buttonsStackView.distribution = .fillEqually
        
        
        addSubview(buttonsStackView)
        
        
        
        buttonsStackView.anchor(nil, left: messageTextView.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 4, rightConstant: 0, widthConstant: 0, heightConstant: 20)
     
        
        addSubview(replyButton)
        addSubview(reTweetButton)
        addSubview(likeButton)
        addSubview(directMessageButton)
        
        replyButton.anchor(replyButtonContainverView.topAnchor, left: replyButtonContainverView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        reTweetButton.anchor(retweetButtonContainverView.topAnchor, left: retweetButtonContainverView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        likeButton.anchor(likeButtonContainerView.topAnchor, left: likeButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        
        directMessageButton.anchor(directMessageContainerView.topAnchor, left: directMessageContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
    
        
    }
    

}
