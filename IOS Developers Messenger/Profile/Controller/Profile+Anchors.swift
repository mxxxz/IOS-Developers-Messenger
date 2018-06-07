//
//  Profile+Anchors.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 05.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import Foundation

extension ProfileController {
    func userInfoContainerSetup(){
        //add subviews
        scrollView.addSubview(profileImage)
        view.addSubview(userNameTextField)
        view.addSubview(userEmailLabel)
        
        view.addSubview(bioTextField)
        view.addSubview(bioCountLabel)
        view.addSubview(bioUpdate)
        
        
        //profileAvatar
        profileImage.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 20).isActive = true
        profileImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 80).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        //UserName
        userNameTextField.topAnchor.constraint(equalTo: profileImage.topAnchor, constant: 10).isActive = true
        userNameTextField.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 12).isActive = true
        userNameTextField.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -10).isActive = true
        userNameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        //Email
        userEmailLabel.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 10).isActive = true
        userEmailLabel.leftAnchor.constraint(equalTo: userNameTextField.leftAnchor).isActive = true
        userEmailLabel.widthAnchor.constraint(equalTo: userNameTextField.widthAnchor).isActive = true
        userEmailLabel.bottomAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: -10).isActive = true
        
        //bio
        bioTextField.leftAnchor.constraint(equalTo: profileImage.leftAnchor).isActive = true
        bioTextField.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10).isActive = true
        //right anchor custom
        //default
        bioTFRightAnchorDefault = bioTextField.rightAnchor.constraint(equalTo: bioUpdate.leftAnchor, constant: -5)
        bioTFRightAnchorDefault?.isActive = false
        //update
        bioTFRightAnchorCustom = bioTextField.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -20)
        bioTFRightAnchorCustom?.isActive = true
        
        bioTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        

        //bio count label
        bioCountLabel.centerYAnchor.constraint(equalTo: bioTextField.centerYAnchor).isActive = true
        bioCountLabel.rightAnchor.constraint(equalTo: bioTextField.rightAnchor, constant: -5).isActive = true
        bioCountLabel.widthAnchor.constraint(equalToConstant: 20).isActive = true
        bioCountLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        //bio save button
        bioUpdate.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -20).isActive = true
        bioUpdate.topAnchor.constraint(equalTo: bioTextField.topAnchor).isActive = true
        bioUpdate.heightAnchor.constraint(equalTo: bioTextField.heightAnchor).isActive = true
        bioUpdate.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    func buttonsContainerSetup(){
        //add subviews
        view.addSubview(separator1)
        view.addSubview(profileChangeImage)
        view.addSubview(separator2)
        view.addSubview(profileChangeUserName)
        view.addSubview(separator3)
        
        //Separator for buttons 1
        separator1.topAnchor.constraint(equalTo: bioTextField.bottomAnchor, constant: 24).isActive = true
        separator1.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        separator1.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        separator1.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        //Change avatar button
        profileChangeImage.topAnchor.constraint(equalTo: separator1.bottomAnchor).isActive = true
        profileChangeImage.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 20).isActive = true
        profileChangeImage.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        profileChangeImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //Separator for buttons 2
        separator2.topAnchor.constraint(equalTo: profileChangeImage.bottomAnchor).isActive = true
        separator2.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        separator2.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        separator2.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        //change user name button
        profileChangeUserName.topAnchor.constraint(equalTo: separator2.bottomAnchor).isActive = true
        profileChangeUserName.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 20).isActive = true
        profileChangeUserName.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        profileChangeUserName.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //Separator for buttons 3
        separator3.topAnchor.constraint(equalTo: profileChangeUserName.bottomAnchor).isActive = true
        separator3.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        separator3.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        separator3.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
    
    func tableViewSectionContainerSetup(){
        view.addSubview(colorView)
        view.addSubview(separator4)
        view.addSubview(decorTableView)
        
        colorView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        colorView.topAnchor.constraint(equalTo: separator3.bottomAnchor).isActive = true
        colorView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        colorView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //separator
        separator4.topAnchor.constraint(equalTo: colorView.bottomAnchor).isActive = true
        separator4.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        separator4.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        separator4.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        decorTableView.topAnchor.constraint(equalTo: separator4.bottomAnchor).isActive = true
        decorTableView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        decorTableView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -8).isActive = true
        decorTableView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        decorTableView.separatorColor = separatorColorTheme
    }
    
    func scrollViewSetup(){
        // add the scroll view to self.view
        self.view.addSubview(scrollView)
        
        // constrain the scroll view to 8-pts on each side
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -44).isActive = true
    }
}
