//
//  User.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import Foundation

class ContactsUser: NSObject{
    var name: String
    var email: String
    var profileAvatar: String
    var profileIdentifier: String
    var bio: String
    
    required init(name: String, email:String,profileAvatar:String,profileIdentifier:String,bio:String) {
        self.name = name
        self.email = email
        self.profileAvatar = profileAvatar
        self.profileIdentifier = profileIdentifier
        self.bio = bio
    }
}

