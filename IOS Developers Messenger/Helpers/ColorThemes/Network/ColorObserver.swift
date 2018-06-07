//
//  ColorObserver.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 06.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import Firebase

class ColorObserver {
    class func observerChangeColorTheme(onSuccess: @escaping(Bool)->Void){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        Database.database().reference().child("Users").child(uid).observe(.childChanged, with: { (snapshot) in
            if snapshot.value as! String == "day" || snapshot.value as! String == "night"{
                if let colorTheme = snapshot.value{
                    ChoiseColorThemeMode.colorTheme(colorThemeMode: colorTheme as! String)
                    onSuccess(true)
                }
            }
        }, withCancel: nil)
    }
}
