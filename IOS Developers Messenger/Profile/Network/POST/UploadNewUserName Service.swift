//
//  UploadNewUserName Service.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import Firebase

class UploadNewUserName{
    
    private init() {}
    
    static let shared = UploadNewUserName()
    
    class func  changeUserName(newUserName: String , onSuccess: @escaping (Bool) -> Void) {
        
        guard let uID = Auth.auth().currentUser?.uid else { return }
        let values = ["name" : newUserName]
        Database.database().reference().child("Users").child(uID).updateChildValues(values) { (error, reference) in
            if error != nil {
                print("Can't update new user name")
                return
            }
            
            onSuccess(true)
        }
        
    }
}

