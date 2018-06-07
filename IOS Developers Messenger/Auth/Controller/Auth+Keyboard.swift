//
//  Auth+Keyboard.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension AuthController {
    //KeyBoardShowNotifications
    func handleKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    //show keyboard handler
    @objc private func keyboardWillShow(notification: NSNotification) {
        if AuthKeyBoardStatus == false {
            self.view.frame.origin.y -= 200
            AuthKeyBoardStatus = true
        }
        
    }
    //hide keyboard handler
    @objc private func keyboardWillHide(notification: NSNotification) {
        if AuthKeyBoardStatus{
            self.view.frame.origin.y += 200
            AuthKeyBoardStatus = false
        }
    }
    
}
