//
//  Registration Service.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import Firebase

class UserRegister {
    
    private init() {}
    
    static let shared = UserRegister()
    
    
    class func registration(Name: String ,Email: String, Password: String, onSuccess: @escaping (Bool) -> Void, onFailure: @escaping (String) -> Void){
        
        //Make visible status bar network activity indicator
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        //Create user
        Auth.auth().createUser(withEmail: Email, password: Password) { (authResult, error) in
            if error != nil {
                //Escaping
                onFailure("Can't to create user")
                //Make unvisible status bar network activity indicator
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                return
            }
            //--If user created:

            //get user id
            guard let uID = authResult?.user.uid else { return }


            let storageRef = Storage.storage().reference().child("Profile_images").child("\(uID) - UserAvatar.jpg")
            var uploadData:Data?

            if let userImage = UserProfileImageVariable {
                //resize
                let resizedImage = userImage.resizeImage(newHeight: 300)
                
                uploadData = UIImageJPEGRepresentation(resizedImage, 1)
            }else{
                uploadData = UIImageJPEGRepresentation(#imageLiteral(resourceName: "defaultProfileImage"), 1)
            }
            
            

            storageRef.putData(uploadData!, metadata: nil, completion: { (metadata, error) in

                if error != nil {
                    //Escaping
                    onFailure("Can't upload user profile image")
                    return
                }
                //-----------------NEW
                storageRef.downloadURL(completion: { (url, error) in
                    if error != nil {
                        print(error)
                        return
                    }
                    guard let profileAvatar = url?.absoluteString else { return }
                    //Parametrs
                    let values = ["name": Name, "email" : Email, "profileAvatar" : profileAvatar, "bio": "", "colorTheme" : "day"]
                    self.registerUserIntoDatabaseWithUID(values: values, uID: uID, onSuccess: { (Result) in
                        if Result{
                            onSuccess(true)
                        }
                    })
                    
                })
            })
        }
    }
    
    private class func registerUserIntoDatabaseWithUID(values: [String:Any], uID: String, onSuccess: @escaping (Bool) -> Void ) {
        //DataBase URL
        let FirebaseReference:DatabaseReference = Database.database().reference()
        //Create global child "Users"
        let usersReference = FirebaseReference.child("Users").child(uID)
        //Updating
        usersReference.updateChildValues(values, withCompletionBlock: { (refError, reference) in
            if refError != nil {
                //Escaping
                return
            }
            //Success escaping
            onSuccess(true)
            
        })
    }
}

