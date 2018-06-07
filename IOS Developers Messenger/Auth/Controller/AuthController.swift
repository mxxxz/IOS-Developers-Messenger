//
//  AuthControllerNew.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

class AuthController: UIViewController, UITextFieldDelegate {
    
    //logo view
    let logo: UIImageView = {
       let view = UIImageView(image: #imageLiteral(resourceName: "AuthLogo"))
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alpha = 0
        return view
    }()
    //segmented control view
    let loginRegisterSegmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Login", "Register"])
        sc.tintColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
        sc.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        sc.selectedSegmentIndex = 1
        sc.alpha = 0
        sc.translatesAutoresizingMaskIntoConstraints = false
        
        //action
        sc.addTarget(self, action: #selector(handleLoginRegisterChange), for: .valueChanged)
        return sc
    }()
    //--inputsContainer
    let inputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(r: 0, g: 0, b: 0).cgColor
        view.alpha = 0
        return view
    }()
    //inside:
        //name text field
        lazy var nameTextField: UITextField = {
            let tf = UITextField()
            tf.placeholder = "User name"
            tf.tintColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
            tf.textColor = .black
            //delegate
            tf.delegate = self
            tf.translatesAutoresizingMaskIntoConstraints = false
            return tf
        }()
    
        //name separator
        let nameSeparatorView: UIView = {
            let view = UIView()
            view.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        //email
        lazy var emailTextField: UITextField = {
            let tf = UITextField()
            tf.placeholder = "E-mail"
            tf.tintColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
            tf.textColor = .black
            //delegate
            tf.delegate = self
            tf.translatesAutoresizingMaskIntoConstraints = false
            tf.keyboardType = .emailAddress
            
            return tf
        }()
        //email separator
        let emailSeparatorView: UIView = {
            let view = UIView()
            view.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        //password view
        lazy var passwordTextField: UITextField = {
            let tf = UITextField()
            tf.placeholder = "Password"
            tf.tintColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
            tf.textColor = .black
            //delegate
            tf.delegate = self
            tf.translatesAutoresizingMaskIntoConstraints = false
            tf.isSecureTextEntry = true
            
            return tf
        }()
        //password separator
        let passwordSeparatorView: UIView = {
           let view = UIView()
            view.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        //profile image upload view
        let profileImageButton: UIButton = {
            let btn = UIButton()
            btn.backgroundColor = .white
            btn.setTitle("Load Profile Image(optional)", for: .normal)
            btn.setTitleColor(#colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1), for: .normal)
            btn.translatesAutoresizingMaskIntoConstraints = false
            
            btn.addTarget(self, action: #selector(handleSelectProfileImage), for: .touchUpInside)
            
            return btn
        }()
    
    //Auth button
    let loginRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
        button.setTitle("Register", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        let titleColor: UIColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        button.setTitleColor(titleColor, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.alpha = 0
        //action
        button.addTarget(self, action: #selector(handleLogInRegister), for: .touchUpInside)
        
        return button
    }()
    
    
    //ACTIVITY INDICATOR
    let generalActivityIndicatorView: UIView = {
       let view = UIView()
        view.alpha = 0
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView()
        ai.activityIndicatorViewStyle = .whiteLarge
        ai.translatesAutoresizingMaskIntoConstraints = false
        ai.alpha = 0
        return ai
    }()
    
    let authStatusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Logging in..."
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.alpha = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(logo)
        view.addSubview(loginRegisterSegmentedControl)
        view.addSubview(inputsContainerView)
        view.addSubview(loginRegisterButton)
        

        setupLogo()
        setupLoginRegisterSegmentedControl()
        setupInputsContainerView()
        setuploginRegisterButton()
        
        //setup activity indicator view
        setupActivityIndicatorContainer()
        //show animate
        showAllViews()
        
        //keyboard
        handleKeyboard()
        
        //uinetworl
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

    
    private func showAllViews(){
        UIView.animate(withDuration: 1.5) {
            self.logo.alpha = 1
            self.loginRegisterSegmentedControl.alpha = 1
            self.inputsContainerView.alpha = 1
            self.loginRegisterButton.alpha = 1
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        handleLogInRegister()
        return true
    }
}
