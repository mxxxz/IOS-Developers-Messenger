//
//  Auth+Anchors.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import Foundation

extension AuthController{
    func setupLogo() {
        //logo
        logo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logo.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        logo.widthAnchor.constraint(equalToConstant: 160).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    func setupLoginRegisterSegmentedControl(){
        //segmented control
        loginRegisterSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterSegmentedControl.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 20).isActive = true
        loginRegisterSegmentedControl.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        loginRegisterSegmentedControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    func setupInputsContainerView() {
        inputsContainerView.topAnchor.constraint(equalTo: loginRegisterSegmentedControl.bottomAnchor, constant: 20).isActive = true
        inputsContainerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        inputsContainerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        //height
        inputsContainerViewHeightAnchor = inputsContainerView.heightAnchor.constraint(equalToConstant: 200)
        inputsContainerViewHeightAnchor?.isActive = true
        
        inputsContainerView.addSubview(nameTextField)
        inputsContainerView.addSubview(nameSeparatorView)
        inputsContainerView.addSubview(emailTextField)
        inputsContainerView.addSubview(emailSeparatorView)
        inputsContainerView.addSubview(passwordTextField)
        inputsContainerView.addSubview(passwordSeparatorView)
        inputsContainerView.addSubview(profileImageButton)
        
        //-Name TextField
        nameTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputsContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        
        nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/4)
        nameTextFieldHeightAnchor?.isActive = true
        
        //Separator
        nameSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        nameSeparatorView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: -1).isActive = true
        nameSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        nameSeparator = nameSeparatorView.heightAnchor.constraint(equalToConstant: 1)
        nameSeparator?.isActive = true
        
        //emailTextField
        emailTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/4)
        emailTextFieldHeightAnchor?.isActive = true
        
        //Separator
        emailSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        emailSeparatorView.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: -1).isActive = true
        emailSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        emailSeparatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //passTextField
        passwordTextField.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/4)
        passwordTextFieldHeightAnchor?.isActive = true
        
        //Separator
        passwordSeparatorView.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        passwordSeparatorView.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: -1).isActive = true
        passwordSeparatorView.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        passSeparator = passwordSeparatorView.heightAnchor.constraint(equalToConstant: 1)
        passSeparator?.isActive = true
        
        //profile image button
        profileImageButton.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        profileImageButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor).isActive = true
        profileImageButton.widthAnchor.constraint(equalTo: inputsContainerView.widthAnchor).isActive = true
        
        profileImageButtonHeightAnchor = profileImageButton.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: 1/4)
        profileImageButtonHeightAnchor?.isActive = true
        
    }
    //setup for auth button
    func setuploginRegisterButton() {
        loginRegisterButton.topAnchor.constraint(equalTo: inputsContainerView.bottomAnchor, constant: 20).isActive = true
        loginRegisterButton.rightAnchor.constraint(equalTo: inputsContainerView.rightAnchor).isActive = true
        loginRegisterButton.leftAnchor.constraint(equalTo: inputsContainerView.leftAnchor).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    //setup for activity indicator view
    func setupActivityIndicatorContainer(){
        view.addSubview(generalActivityIndicatorView)
        
        generalActivityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        generalActivityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        generalActivityIndicatorView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        generalActivityIndicatorView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        view.addSubview(activityIndicatorView)
        
        activityIndicatorView.centerXAnchor.constraint(equalTo: generalActivityIndicatorView.centerXAnchor).isActive = true
        activityIndicatorView.centerYAnchor.constraint(equalTo: generalActivityIndicatorView.centerYAnchor, constant: -15).isActive = true
        
        view.addSubview(authStatusLabel)
        
        authStatusLabel.centerXAnchor.constraint(equalTo: generalActivityIndicatorView.centerXAnchor).isActive = true
        authStatusLabel.topAnchor.constraint(equalTo: activityIndicatorView.bottomAnchor, constant: 20).isActive = true
    }
}
