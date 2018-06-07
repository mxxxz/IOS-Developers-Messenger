//
//  Profile+NavigationBar.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension ProfileController {
    func setupNavigationBar(){
        navigationItem.title = "Settings"
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
        //Logout item
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "exit"), style: .plain, target: self, action: #selector(handleLogout))
        
        //color theme
        navigationController?.navigationBar.barTintColor = navBarBackgroundColorTheme
        navigationController?.navigationBar.tintColor = navBarTintColorTheme
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: navBarTitleTextAttributesColorTheme]
        
    }
    
    func setupTabBarLocal(){
        //color theme
        tabBarController?.tabBar.tintColor = tabBarTintColorTheme
        tabBarController?.tabBar.barTintColor = tabBarBackgroundColorTHeme
    }
}
