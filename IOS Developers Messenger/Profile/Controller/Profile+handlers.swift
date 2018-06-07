//
//  Profile+handlers.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit
import Firebase

extension ProfileController {
    
    //Load user personal data
    func handleLoadUserProfileData() {
        //load another views
        self.userNameTextField.text = UserNameVariable
        self.userEmailLabel.text = UserEmailVariable
        self.bioTextField.text = UserBioVaribale
        //show views
        self.profileImage.isHidden = false
        self.separator1.isHidden = false
        self.separator2.isHidden = false
        self.separator3.isHidden = false
        self.profileChangeImage.isHidden = false
        self.profileChangeUserName.isHidden = false
        self.bioTextField.isHidden = false
        self.bioCountLabel.isHidden = false
        self.bioUpdate.isHidden = false
        
        self.colorView.isHidden = false
        self.separator4.isHidden = false
        self.decorTableView.isHidden = false
        //Create Queue for image
        let imageQueue = DispatchQueue.global(qos: .default)
        imageQueue.async {
            guard let url = UserProfileImageUrlVariable, let imageData = try? Data(contentsOf: url) else {return}
            //after in main Thread
            DispatchQueue.main.async {
                //load image
                self.profileImage.image = UIImage(data: imageData)
                //Make unvisible status bar network activity indicator
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        }
    }
    
    
    //Change user profile User Name
    @objc func handleLoginTF(){
        //change text color
        profileChangeUserName.setTitleColor(.black, for: .normal)
        
        let ac = UIAlertController(title: "Input new User Name", message: nil, preferredStyle: .alert)
        let done = UIAlertAction(title: "Done", style: .default) { (action) in
            
            let textField = ac.textFields?[0]
            guard let text = textField?.text else { return }
            UploadNewUserName.changeUserName(newUserName: text, onSuccess: { (Result) in
                if Result{
                    //change text color
                    self.profileChangeUserName.setTitleColor(buttonsTextColorTheme, for: .normal)
                    //put new name in tf
                    self.userNameTextField.text = text
                    
                }
            })
        }
        let cancel = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
            self.profileChangeUserName.setTitleColor(UIColor(r: 0, g: 122, b: 255), for: .normal)
        }
        ac.addTextField {
            textField in
        }
        ac.addAction(done)
        ac.addAction(cancel)
        
        //present alert
        present(ac, animated: true, completion: nil)
        
    }
    
    
    //Logout method
    @objc func handleLogout() {
        UserProfileImageVariable = nil
        
        //Made logout by do catch block
        do{
            try Auth.auth().signOut()
        }catch let logoutError{
            print("Can't logOut - \(logoutError)")
        }
        
        //present to auth controller
        let authController = AuthController()
        present(authController, animated: true, completion: nil)
    }
    
    
    //send message by return button(IOS)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        handleBioUpdate()
        return true
    }
    
    
    //BIO
    //general bio handler
    @objc func handleBio(){
        //animate change constraints
        handleBioTfUserInput()
        //change count label text
        bioCountLabel.text = String(30 - (bioTextField.text?.count)!)
    }
    //animate and controll user bio input
    func handleBioTfUserInput(){
        if bioTextField.text?.count != 0 {
            self.bioUpdate.alpha = 1
            bioTFRightAnchorDefault?.isActive = true
            bioTFRightAnchorCustom?.isActive = false
            self.bioCountLabel.textColor = textColorTheme
        }else{
            self.bioUpdate.alpha = 0
            bioTFRightAnchorDefault?.isActive = false
            bioTFRightAnchorCustom?.isActive = true
            self.bioCountLabel.textColor = textColorTheme
        }
    }
    //handle save bio and update
    @objc func handleBioUpdate(){
        bioUpdate.alpha = 0
        bioTFRightAnchorCustom?.isActive = true
        bioTFRightAnchorDefault?.isActive = false
        bioCountLabel.textColor = textColorTheme
        bioTextField.endEditing(true)
        
        //update in database new bio
        guard let bio = bioTextField.text else { return }
        UploadNewUserBio.updateBio(newUserBio: bio)
        
    }
    
    //handle color theme changed
    func handleColorTheme(){
        //observer colors
        ColorObserver.observerChangeColorTheme { (Result) in
            if Result{
                self.view.backgroundColor = viewBackgroundColorTheme
                self.userNameTextField.textColor = textColorTheme
                self.bioTextField.backgroundColor = viewBackgroundColorTheme
                self.bioTextField.tintColor = buttonsTextColorTheme
                self.bioTextField.textColor = textColorTheme
                self.bioTextField.attributedPlaceholder = NSAttributedString(string: "B.I.O", attributes: [NSAttributedStringKey.foregroundColor: placeholderColorTheme])
                self.bioUpdate.setTitleColor(buttonsTextColorTheme, for: .normal)
                self.bioCountLabel.textColor = textColorTheme
                
                self.profileChangeImage.setTitleColor(buttonsTextColorTheme, for: .normal)
                self.profileChangeUserName.setTitleColor(buttonsTextColorTheme, for: .normal)
                
                self.colorView.backgroundColor = colorViewColorTheme
                
                self.setupNavigationBar()
                
                self.setupTabBarLocal()
                
            }
        }
    }
}

