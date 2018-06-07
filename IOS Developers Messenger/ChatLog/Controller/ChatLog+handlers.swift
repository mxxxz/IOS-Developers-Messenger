//
//  ChatLog+handlers.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension ChatLogController {
    //reload collection view
    @objc private func reloadCollectionView(){
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
    }
    //observe
    func handleObserve(){
        //identifier for observe
        guard let userIdentifier = self.user?.profileIdentifier else { return }
        //call observe service
        ObserveChatLog.observeCurrentUserMessages(userIdetifier: userIdentifier) { (Result) in
            if Result{
                //timer invalidate
                self.timer?.invalidate()
                self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.reloadCollectionView), userInfo: nil, repeats: false)
            }
        }
    }
    //User input controller
    @objc func handleUserInput() -> Bool{
        if inputTextField.text?.count != 0 {
            UIView.animate(withDuration: 0.5) {
                self.sendButton.alpha = 1
            }
            return true
        }else{
            UIView.animate(withDuration: 0.5) {
                self.sendButton.alpha = 0
            }
            return false
        }
    }
    
    //------------Send message
    //send message
    @objc func handleSend() {
        guard let input = inputTextField.text else { return }
        
        //send message
        SendMessage.sendMessageFunc(input: input)
        //Reset input text
        inputTextField.text = ""
        //hide send button
        UIView.animate(withDuration: 0.5) {
            self.sendButton.alpha = 0
        }
    }
    
    //handle color theme changed
    func handleColorTheme(){
        ColorObserver.observerChangeColorTheme { (Result) in
            if Result{
                //color theme
                self.containerView.backgroundColor = viewBackgroundColorTheme
                self.navigationController?.navigationBar.barTintColor = navBarBackgroundColorTheme
                self.navigationController?.navigationBar.tintColor = navBarTintColorTheme
                self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: navBarTitleTextAttributesColorTheme]
                
                self.sendButton.setImage(sendButtonImageByColorTheme, for: .normal)
                
                self.inputTextField.keyboardAppearance = keyboardAppearanceByColorTheme!
                self.inputTextField.backgroundColor = viewBackgroundColorTheme
                self.inputTextField.tintColor = buttonsTextColorTheme
                self.inputTextField.textColor = textColorTheme
                self.inputTextField.attributedPlaceholder = NSAttributedString(string: "Message...", attributes: [NSAttributedStringKey.foregroundColor: placeholderColorTheme])
                
            }
        }
    }
}

