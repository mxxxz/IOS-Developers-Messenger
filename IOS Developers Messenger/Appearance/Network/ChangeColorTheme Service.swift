//
//  ChangeColorTheme Service.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 06.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import Firebase

class ChangeUserColorTheme {
    private init() {}
    static let shared = ChangeUserColorTheme()
    
    class func updateColorTheme(newColorTheme: String){
        guard let uID = Auth.auth().currentUser?.uid else { return }
        let values = ["colorTheme" : newColorTheme]
        Database.database().reference().child("Users").child(uID).updateChildValues(values) { (error, reference) in
            if error != nil {
                print("Can't update new user color theme")
                return
            }
        }
    }
}
