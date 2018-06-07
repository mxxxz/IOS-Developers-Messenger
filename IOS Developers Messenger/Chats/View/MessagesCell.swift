//
//  MessagesCell.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit
import Firebase

class MessagesCell: UITableViewCell {
    
    var message: Message? {
        didSet{
            setupNameAndAvatar()
            
            messageLabel.text = message?.text
            
            //timeStamp
            
            if let seconds = message?.timeStamp {
                let timestampDate = Date(timeIntervalSince1970: seconds)
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "HH:mm:ss a"
                timeLabel.text = dateFormatter.string(from: timestampDate)
            }
        }
    }
    //method for correct show message data
    private func setupNameAndAvatar() {
        if let id = message?.chatPartnerID() {
            let ref = Database.database().reference().child("Users").child(id)
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                
                if let dictionary = snapshot.value as? [String:AnyObject] {
                    self.userNameLabel.text = dictionary["name"] as? String
                    
                    if let userImageView = dictionary["profileAvatar"] {
                        self.userImageView.loadImageUsingCacheWithUrlString(urlString: userImageView as! String)
                        
                    }
                }
                
            }, withCancel: nil)
        }
    }
    let userImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 30
        image.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let userNameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        //color theme
        label.textColor = textColorTheme
        return label
    }()
    
    let messageLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        //color theme
        label.textColor = textColorTheme
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = timeLabelTextColorTheme
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        
        //selection style
        selectionStyle = .none
        
        //observer for handle color theme
        ColorObserver.observerChangeColorTheme { (Result) in
            if Result{
                self.userNameLabel.textColor = textColorTheme
                self.messageLabel.textColor = textColorTheme
                self.timeLabel.textColor = timeLabelTextColorTheme
            }
        }
        
        addSubview(userImageView)
        addSubview(userNameLabel)
        addSubview(messageLabel)
        addSubview(timeLabel)
        
        //ios 9 constraints
        //avatar
        userImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        userImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        //User name label
        userNameLabel.leftAnchor.constraint(equalTo: userImageView.rightAnchor, constant: 10).isActive = true
        userNameLabel.topAnchor.constraint(equalTo: userImageView.topAnchor, constant: 10).isActive = true
        userNameLabel.rightAnchor.constraint(equalTo: timeLabel.leftAnchor, constant: -10).isActive = true
        userNameLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        //message label
        messageLabel.leftAnchor.constraint(equalTo: userNameLabel.leftAnchor, constant: 2).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: -10).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        messageLabel.heightAnchor.constraint(equalToConstant: 13).isActive = true
        
        //time label
        timeLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 15).isActive = true
        timeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 23).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        timeLabel.heightAnchor.constraint(equalTo: userNameLabel.heightAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
