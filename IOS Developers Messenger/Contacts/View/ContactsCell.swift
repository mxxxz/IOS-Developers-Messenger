//
//  ContactsCell.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import  UIKit

class ContactsCell: UITableViewCell {
    
    let profileAvatar: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 20
        image.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel?.frame = CGRect(x: 60, y: textLabel!.frame.origin.y, width: textLabel!.frame.width, height: textLabel!.frame.height)
        
        textLabel?.textColor = textColorTheme
    }
    
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        //selection style
        selectionStyle = .none
        
        
        //observer for handle color theme
        ColorObserver.observerChangeColorTheme { (Result) in
            if Result{
                self.textLabel?.textColor = textColorTheme
            }
        }
        //indicator
        accessoryType = .disclosureIndicator
        
        addSubview(profileAvatar)
        //ios 9 constraints
        
        profileAvatar.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        profileAvatar.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        profileAvatar.widthAnchor.constraint(equalToConstant: 40).isActive = true
        profileAvatar.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

