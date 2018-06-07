//
//  ChatLog+Keyboard.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension ChatLogController {
    //KeyBoardShowNotifications
    func handleKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    //show keyboard handler
    @objc private func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                //change height of collectionview
                if keyboardSize.height != 258 {
                    let local = 258 - keyboardSize.height
                    self.view.frame.origin.y -= keyboardSize.height + local
                }else{
                    self.view.frame.origin.y -= keyboardSize.height
                }
            }
        }
        
    }
    //hide keyboard handler
    @objc private func keyboardWillHide(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                //change height of collectionview
                if keyboardSize.height != 258 {
                    let local = 258 - keyboardSize.height
                    self.view.frame.origin.y += keyboardSize.height + local
                }else{
                    self.view.frame.origin.y += keyboardSize.height
                }
            }
        }
    }
    
}
