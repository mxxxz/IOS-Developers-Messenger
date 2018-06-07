//
//  User Personal Data.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import Firebase

class UserProfileData {
    
    private init() {}
    
    static let shared = UserProfileData()
    
    class func getProfileUserName(onSuccess: @escaping (Bool) -> Void){
        guard let uID = Auth.auth().currentUser?.uid else { return }
        Database.database().reference().child("Users").child(uID).observeSingleEvent(of: .value) { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject] {
                UserNameVariable = (dictionary["name"] as? String)!
                UserEmailVariable = (dictionary["email"] as? String)!
                UserBioVaribale = (dictionary["bio"] as? String)!
                UserColorThemeVariable = (dictionary["colorTheme"] as? String)
                UserProfileImageUrlVariable = URL(string: (dictionary["profileAvatar"] as? String)!)
                onSuccess(true)
            }
            
        }
    }
}

