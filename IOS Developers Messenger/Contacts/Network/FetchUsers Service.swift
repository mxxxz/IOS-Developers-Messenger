//
//  FetchUsers Service.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import Firebase

class FetchUsers {
    private init() {}
    
    static let shared = FetchUsers()

    class func fetchUsersData(onSuccess: @escaping(Bool) -> Void){
        users.removeAll()
        //delete self user from arrays
        UserProfileData.getProfileUserName { (Result) in
            if Result{
                Database.database().reference().child("Users").observe(.childAdded) { (snapshot) in
                    if let dictionary = snapshot.value as? [String: AnyObject] {
                        if let authUserId = Auth.auth().currentUser?.uid {
                            if snapshot.key != authUserId {
                                let userId = snapshot.key as? String
                                
                                guard let name = dictionary["name"], let email = dictionary["email"], let profileAvatar = dictionary["profileAvatar"],let profileIdentifier = userId, let bio = dictionary["bio"] else { return }
                                let user = ContactsUser.init(name: name as! String, email: email as! String, profileAvatar: profileAvatar as! String,profileIdentifier: profileIdentifier, bio: bio as! String)
                                
                                users.append(user)
                                
                                onSuccess(true)
                            }
                        }
                    }
                }
            }
        }
    }
}
