//
//  UploadNewUserBio Service.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 05.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import Firebase

class UploadNewUserBio {
    private init() {}
    
    static let shared = UploadNewUserBio()
    
    class func updateBio(newUserBio: String){
        guard let uID = Auth.auth().currentUser?.uid else { return }
        let values = ["bio" : newUserBio]
        Database.database().reference().child("Users").child(uID).updateChildValues(values) { (error, reference) in
            if error != nil {
                print("Can't update new user bio")
                return
            }
        }
    }
}
