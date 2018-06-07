//
//  Login Service.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import Firebase

class UserLogIn{
    
    private init() {}
    
    static let shared = UserLogIn()
    
    class func logIn(Email: String, Password: String, onSuccess: @escaping (Bool) -> Void){
        //Make visible status bar network activity indicator
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        //Sigh in
        Auth.auth().signIn(withEmail: Email, password: Password) { (user, error) in
            if error != nil {
                //Escaping
                onSuccess(false)
                //hide network indicator
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                return
            }
            //If sign in complited
            onSuccess(true)
            
        }
    }
    
}

