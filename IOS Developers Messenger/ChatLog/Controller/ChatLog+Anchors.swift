//
//  ChatLog+Anchors.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 03.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension ChatLogController {
    func setupInputComponents() {
        
        view.addSubview(containerView)
        
        //
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        containerView.addSubview(sendButton)
        
        sendButton.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5).isActive = true
        sendButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        sendButton.heightAnchor.constraint(equalTo: containerView.heightAnchor).isActive = true
        
        
        containerView.addSubview(inputTextField)
        
        inputTextField.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive = true
        inputTextField.rightAnchor.constraint(equalTo: sendButton.leftAnchor, constant: -5).isActive = true
        
        
        inputTextField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        inputTextField.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        
        //Separator setup
        let separatorLineView = UIView()
        separatorLineView.translatesAutoresizingMaskIntoConstraints = false
        separatorLineView.backgroundColor = #colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)
        
        containerView.addSubview(separatorLineView)
        
        separatorLineView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        separatorLineView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        separatorLineView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        separatorLineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
    }
}
