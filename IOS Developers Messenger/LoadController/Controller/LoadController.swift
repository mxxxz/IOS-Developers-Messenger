//
//  LoadController.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 06.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit
import Firebase

class LoadController: UIViewController {
    let activityIndicator: UIActivityIndicatorView = {
       let ai = UIActivityIndicatorView()
        ai.activityIndicatorViewStyle = .gray
        ai.startAnimating()
        
        ai.translatesAutoresizingMaskIntoConstraints = false
        return ai
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(activityIndicator)
        
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        handlePresent()
    }
    func handlePresent(){
        if Auth.auth().currentUser?.uid == nil{
            perform(#selector(handleSession), with: nil, afterDelay: 0)
        }else{
            UserProfileData.getProfileUserName { (Result) in
                if Result{
                    if let colorThemeMode = UserColorThemeVariable {
                        ChoiseColorThemeMode.colorTheme(colorThemeMode: colorThemeMode)
                    }
                    
                    self.activityIndicator.stopAnimating()
                    
                    
                    let nextController = CustomTabBarController()
                    self.present(nextController, animated: true, completion: nil)
                }
            }
        }
    }
    //Present auth controller if user not sign in
    @objc func handleSession() {
        //present to auth controller
        let authController = AuthController()
        present(authController, animated: true, completion: nil)
    }
    
}
