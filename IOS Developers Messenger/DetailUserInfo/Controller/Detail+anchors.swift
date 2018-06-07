//
//  Detail+anchors.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 07.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension DetailUserInfoController{
    func detailInfoContainerSetup(){
        view.addSubview(currentUserNameView)
        
        view.addSubview(emailGeneralLabel)
        view.addSubview(currentUserEmailView)
        view.addSubview(separator)
        
        view.addSubview(bioGeneralLabel)
        view.addSubview(currentUserBioView)
        view.addSubview(separator1)
        //user name
        currentUserNameView.topAnchor.constraint(equalTo: currentUserProfileImageView.topAnchor, constant: 20).isActive = true
        currentUserNameView.leftAnchor.constraint(equalTo: currentUserProfileImageView.rightAnchor, constant: 10).isActive = true
        currentUserNameView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -20).isActive = true
        currentUserNameView.bottomAnchor.constraint(equalTo: currentUserProfileImageView.bottomAnchor, constant: -20).isActive = true
        //email label
        emailGeneralLabel.topAnchor.constraint(equalTo: currentUserProfileImageView.bottomAnchor, constant: 30).isActive = true
        emailGeneralLabel.leftAnchor.constraint(equalTo: currentUserProfileImageView.leftAnchor, constant: 20).isActive = true
        emailGeneralLabel.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -20).isActive = true
        emailGeneralLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        //email view
        currentUserEmailView.leftAnchor.constraint(equalTo: emailGeneralLabel.leftAnchor).isActive = true
        currentUserEmailView.topAnchor.constraint(equalTo: emailGeneralLabel.bottomAnchor, constant: 5).isActive = true
        currentUserEmailView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -20).isActive = true
        currentUserEmailView.heightAnchor.constraint(equalToConstant: 20).isActive  = true
        
        //separator
        separator.leftAnchor.constraint(equalTo: currentUserEmailView.leftAnchor).isActive = true
        separator.topAnchor.constraint(equalTo: currentUserEmailView.bottomAnchor, constant: 10).isActive = true
        separator.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        //bio label
        bioGeneralLabel.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 10).isActive = true
        bioGeneralLabel.leftAnchor.constraint(equalTo: separator.leftAnchor).isActive = true
        bioGeneralLabel.rightAnchor.constraint(equalTo: emailGeneralLabel.rightAnchor).isActive = true
        bioGeneralLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        //bio view
        currentUserBioView.leftAnchor.constraint(equalTo: emailGeneralLabel.leftAnchor).isActive = true
        currentUserBioView.topAnchor.constraint(equalTo: bioGeneralLabel.bottomAnchor, constant: 5).isActive = true
        currentUserBioView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: -20).isActive = true
        currentUserBioView.heightAnchor.constraint(equalToConstant: 20).isActive  = true
        
        //separator
        separator1.leftAnchor.constraint(equalTo: currentUserEmailView.leftAnchor).isActive = true
        separator1.topAnchor.constraint(equalTo: currentUserBioView.bottomAnchor, constant: 10).isActive = true
        separator1.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        separator1.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
    
    func scrollViewSetup(){
        // add the scroll view to self.view
        self.view.addSubview(scrollView)
        
        // constrain the scroll
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollView.addSubview(currentUserProfileImageView)
        
        currentUserProfileImageView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 20).isActive = true
        currentUserProfileImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        currentUserProfileImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        currentUserProfileImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
}
