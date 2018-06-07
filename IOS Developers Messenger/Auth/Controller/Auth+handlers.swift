
//  Auth+handlers.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.


import UIKit

extension AuthController {
    
    //--swift between log in and register
    @objc func handleLoginRegisterChange() {
        //get title of selected segment
        let title = loginRegisterSegmentedControl.titleForSegment(at: loginRegisterSegmentedControl.selectedSegmentIndex)
        //change button title for active segment
        loginRegisterButton.setTitle(title, for: .normal)
        
        //change height of inputContainerView
        inputsContainerViewHeightAnchor?.constant = self.loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 100 : 200
        
        //change height of Tname textfield
        nameTextFieldHeightAnchor?.isActive = false
        nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 0 : 1/4)
        nameTextFieldHeightAnchor?.isActive = true
        
        //Change height of separator
        nameSeparator?.constant = loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 0 : 1
        
        //Change height of email textfield
        emailTextFieldHeightAnchor?.isActive = false
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/4)
        emailTextFieldHeightAnchor?.isActive = true
        
        //Change height of password textfield
        passwordTextFieldHeightAnchor?.isActive = false
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/4)
        passwordTextFieldHeightAnchor?.isActive = true
        
        //Change height of profile image button
        profileImageButtonHeightAnchor?.isActive = false
        profileImageButtonHeightAnchor = profileImageButton.heightAnchor.constraint(equalTo: inputsContainerView.heightAnchor, multiplier: loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 0 : 1/4)
        profileImageButtonHeightAnchor?.isActive = true
        //hide title
        profileImageButton.setTitle(loginRegisterSegmentedControl.selectedSegmentIndex == 0 ? "" : "Load Profile Image(optional)", for: .normal)
    }
    
    //Global auth method
    @objc func handleLogInRegister() {
        
        if loginRegisterSegmentedControl.selectedSegmentIndex == 0 {
            handleLogIn()
        }else{
            handleRegister()
        }
    }
    
    //alert for uncorrect user input
    func userInputCorrectController(message: String){
        let ac = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        ac.addAction(ok)
        
        present(ac, animated: true, completion: nil)
    }
    
    //Log In method
    @objc func handleLogIn(){
        
        
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            print("Form is not valid")
            return
        }
        if emailTextField.text != "" && passwordTextField.text != "" {
             self.handleShowActivityIndicator(show: true)
            UserLogIn.logIn(Email: email, Password: password) { (Result) in
                if Result{
                    //make unvisible status bar network activity indicator
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    
                    self.handleShowActivityIndicator(show: false)
                    
                    //Present Next Controller
                    let loadController = LoadController()
                    self.present(loadController, animated: true, completion: nil)
                }else{
                    self.userInputCorrectController(message: "Wrong email or password")
                    print("Can't sign in user")
                    //reset user input
                    self.emailTextField.text = ""
                    self.passwordTextField.text = ""
                    
                }
            }
        }
    }
    
    //Registration method
    @objc func handleRegister() {
        
        guard let name = nameTextField.text , let email = emailTextField.text, let password = passwordTextField.text else {
            print("Form is not valid")
            return
        }
        if name != "" && email != "" && password != ""{
            self.handleShowActivityIndicator(show: true)
            //Call network method for registration
            UserRegister.registration(Name: name, Email: email, Password: password, onSuccess: { (Success) in
                
                //If return is Success
                if Success {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    self.handleShowActivityIndicator(show: false)
                    
                    print("Registration complited")
                    //Present Next Controller
                    let loadController = LoadController()
                    self.present(loadController, animated: true, completion: nil)
                }
                //If return is Failure
            }) { (Failure) in
                self.userInputCorrectController(message: "E-mail already registered")
                //reset user input
                self.nameTextField.text = ""
                self.emailTextField.text = ""
                self.passwordTextField.text = ""
                
                //failure print
                print(Failure)
            }
        }
    }
    //handle activity indicator view show or hide
    func handleShowActivityIndicator(show: Bool){
        if show{
            UIView.animate(withDuration: 0.5) {
                self.activityIndicatorView.startAnimating()
                self.generalActivityIndicatorView.alpha = 0.7
                self.activityIndicatorView.alpha = 1
                self.authStatusLabel.alpha = 1
            }
        }else{
            UIView.animate(withDuration: 0.5) {
                self.generalActivityIndicatorView.alpha = 0
                self.activityIndicatorView.alpha = 0
                self.activityIndicatorView.stopAnimating()
                self.authStatusLabel.alpha = 0
            }
        }
    }
}
