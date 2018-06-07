//
//  DetailUserInfoController.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 05.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

class DetailUserInfoController: UIViewController {
    
    
    var currentUser: ContactsUser? {
        didSet{
            guard let imageUrl = currentUser?.profileAvatar, let userName = currentUser?.name, let userEmail = currentUser?.email, let userBio = currentUser?.bio else { return }
            //image
            currentUserProfileImageView.loadImageUsingCacheWithUrlString(urlString: imageUrl)
            //name
            currentUserNameView.text = userName
            //email
            currentUserEmailView.text = userEmail
            //bio
            currentUserBioView.text = (userBio == "") ? "No bio" : userBio
        }
    }
    
    
    let currentUserProfileImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        imageView.image = #imageLiteral(resourceName: "defaultProfileImage")
        imageView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.contentSize.height = 700
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let currentUserNameView: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = textColorTheme
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let emailGeneralLabel: UILabel = {
        let label = UILabel()
        label.text = "e-mail"
        label.textColor = buttonsTextColorTheme
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let currentUserEmailView: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = textColorTheme
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //separator
    let separator: UIView = {
       let view = UIView()
        view.backgroundColor = separatorColorTheme
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //bio
    let bioGeneralLabel: UILabel = {
        let label = UILabel()
        label.text = "bio"
        label.textColor = buttonsTextColorTheme
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let currentUserBioView: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = textColorTheme
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //separator 1
    let separator1: UIView = {
        let view = UIView()
        view.backgroundColor = separatorColorTheme
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navbar
        navigationBarSetup()
        //view
        view.backgroundColor = colorViewColorTheme
        
        scrollViewSetup()
        
        detailInfoContainerSetup()
        
        handleColorTheme()
    }
}
