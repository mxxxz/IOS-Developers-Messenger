//
//  ProfileController.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit
class ProfileController: UIViewController, UITextFieldDelegate, UITableViewDelegate {
    
    //max limit in bio tf
    let limitLength: Int = 30
    
    //cell id
    let cellID = "ProfileCell"
    
    
    let profileImage: UIImageView = {
        let image = UIImageView()
        if let userImage = UserProfileImageVariable {
            image.image = UserProfileImageVariable
        }
        image.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        image.layer.cornerRadius = 40
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isHidden = true
        return image
    }()
    
    let userNameTextField: UITextField = {
        let un = UITextField()
        un.font = UIFont.boldSystemFont(ofSize: 20)
        un.backgroundColor = .clear
        un.isEnabled = false
        un.textColor = textColorTheme
        un.alpha = 0.5
        un.translatesAutoresizingMaskIntoConstraints = false
        return un
    }()
    let userEmailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //bio
    lazy var bioTextField: UITextField = {
       let tf = UITextField()
        //left padding for bio
        let paddingLeftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 50))
        tf.leftView = paddingLeftView
        tf.leftViewMode = UITextFieldViewMode.always
        //right padding for bio
        let paddingRightView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 50))
        tf.rightView = paddingRightView
        tf.rightViewMode = UITextFieldViewMode.always
        tf.attributedPlaceholder = NSAttributedString(string: "B.I.O", attributes: [NSAttributedStringKey.foregroundColor: placeholderColorTheme])
        tf.backgroundColor = viewBackgroundColorTheme
        tf.tintColor = buttonsTextColorTheme
        tf.textColor = textColorTheme
        tf.layer.cornerRadius = 10
        tf.clipsToBounds = true
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
        tf.translatesAutoresizingMaskIntoConstraints = false
        //delegate
        tf.delegate = self
        
        tf.isHidden = true
        
        tf.addTarget(self, action: #selector(handleBio), for: .editingChanged)
        return tf
    }()
    //delegate controll
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = bioTextField.text else { return true }
        let newLength = text.characters.count + string.characters.count - range.length
        return newLength <= limitLength
    }
    //bio count label
    let bioCountLabel: UILabel = {
       let label = UILabel()
        label.text = "30"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = textColorTheme
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    //bio save button
    let bioUpdate: UIButton = {
       let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(buttonsTextColorTheme, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.alpha = 0
        button.isHidden = true
        button.addTarget(self, action: #selector(handleBioUpdate), for: .touchUpInside)
        return button
    }()
    //separator
    let separator1: UIView = {
        let sp = UIView()
        sp.backgroundColor = separatorColorTheme
        sp.translatesAutoresizingMaskIntoConstraints = false
        sp.isHidden = true
        return sp
    }()
    //change profile image button
    let profileChangeImage: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("Change my avatar", for: .normal)
        btn.setTitleColor(buttonsTextColorTheme, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(handleSelectProfileImage), for: .touchUpInside)
        btn.isHidden = true
        btn.contentHorizontalAlignment = .left
        return btn
    }()
    //separator
    let separator2: UIView = {
        let sp = UIView()
        sp.backgroundColor = separatorColorTheme
        sp.translatesAutoresizingMaskIntoConstraints = false
        sp.isHidden = true
        return sp
    }()
    //profile change user name button
    let profileChangeUserName: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("Change my name", for: .normal)
        btn.setTitleColor(buttonsTextColorTheme, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.isHidden = true
        btn.addTarget(self, action: #selector(handleLoginTF), for: .touchUpInside)
        btn.contentHorizontalAlignment = .left
        return btn
    }()
    //separator
    let separator3: UIView =  {
        let sp = UIView()
        sp.backgroundColor = separatorColorTheme
        sp.translatesAutoresizingMaskIntoConstraints = false
        sp.isHidden = true
        return sp
    }()
    
    //view with another background color
    let colorView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = colorViewColorTheme
        view.isHidden = true
        return view
    }()
    
    //separator
    let separator4: UIView =  {
        let sp = UIView()
        sp.backgroundColor = separatorColorTheme
        sp.translatesAutoresizingMaskIntoConstraints = false
        sp.isHidden = true
        return sp
    }()
    
    lazy var decorTableView: UITableView = {
       let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.isScrollEnabled = false
        tv.isHidden = true
        
        //protocols
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()
    
    //scrollViwe for scroll
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.contentSize.height = 600
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //navbar
        setupNavigationBar()
        
        //scrollViewSetup
        scrollViewSetup()
        
        //background
        view.backgroundColor = viewBackgroundColorTheme
        //user container setup
        userInfoContainerSetup()
        //change buttons setup
        buttonsContainerSetup()
        
        //tableView Setup
        tableViewSectionContainerSetup()

        //load user data
        handleLoadUserProfileData()
        
        //Make visible status bar network activity indicator
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        //register
        decorTableView.register(ProfileCell.self, forCellReuseIdentifier: cellID)
        //observe color theme change
        handleColorTheme()
        
    }
}
