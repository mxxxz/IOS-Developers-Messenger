//
//  ChatLog+NavigationBar.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit
import Firebase

extension ChatLogController{
    
    func navigationBarSetup(userImage: String){
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        imageView.loadImageUsingCacheWithUrlString(urlString: userImage)
        
        imageView.image = imageView.image?.resizeImage(newHeight: 38)
        
        let profileImageButton = UIButton(type: .system)
        profileImageButton.setImage(imageView.image?.withRenderingMode(.alwaysOriginal), for: .normal)
        profileImageButton.frame = CGRect(x: 0, y: 0, width: 38, height: 38)
        profileImageButton.layer.cornerRadius = profileImageButton.frame.height / 2
        profileImageButton.clipsToBounds = true
        
        //target
        profileImageButton.addTarget(self, action: #selector(pushDetailUserInfoController), for: .touchUpInside)
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: profileImageButton)
        
        
        //color theme
        navigationController?.navigationBar.barTintColor = navBarBackgroundColorTheme
        navigationController?.navigationBar.tintColor = navBarTintColorTheme
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: navBarTitleTextAttributesColorTheme]
    }
    
    //push detaul controller
    @objc func pushDetailUserInfoController(){
        let detail = DetailUserInfoController()
        
        //post user data
        detail.currentUser = user
        //hide tabbar
        self.hidesBottomBarWhenPushed = true
        //push
        navigationController?.pushViewController(detail, animated: true)
    }
}
