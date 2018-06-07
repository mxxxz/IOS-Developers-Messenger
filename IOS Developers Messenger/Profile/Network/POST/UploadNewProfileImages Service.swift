//
//  UploadNewProfileImages Service.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import Firebase


class UploadNewProfileImage{
    private init() {}
    
    static let shared = UploadNewProfileImage()
    
    
    class func changeProfileImage(onSuccess: @escaping (Bool) -> Void){
        
        guard let uID = Auth.auth().currentUser?.uid else { return }
        let storageRef = Storage.storage().reference().child("Profile_images").child("\(uID) - UserAvatar.jpg")

        if let userImage = UserProfileImageVariable {
            let uploadData = UIImageJPEGRepresentation(userImage, 0.1)

            storageRef.putData(uploadData!, metadata: nil) { (metadata, error) in
                if error != nil {
                    print(error)
                    return
                }

                storageRef.downloadURL(completion: { (url, error) in
                    if error != nil {
                        print(error)
                        return
                    }
                    guard let downloadUrl = url?.absoluteString else { return }
                    let values = ["profileAvatar" : downloadUrl]
                    Database.database().reference().child("Users").child(uID).updateChildValues(values, withCompletionBlock: { (error, reference) in
                        onSuccess(true)
                    })
                    
                })

            }

        }
    }
}

