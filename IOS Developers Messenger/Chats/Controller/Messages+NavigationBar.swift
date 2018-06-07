//
//  Messages+NavigationBar.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension MessagesController {
    func navigationBarSetup(){
        //Title
        navigationItem.title = "Chats"
        
        //color theme
        navigationController?.navigationBar.barTintColor = navBarBackgroundColorTheme
        navigationController?.navigationBar.tintColor = navBarTintColorTheme
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: navBarTitleTextAttributesColorTheme]
    }
    
    func tabBarLocalSetup(){
        //color theme
        tabBarController?.tabBar.tintColor = tabBarTintColorTheme
        tabBarController?.tabBar.barTintColor = tabBarBackgroundColorTHeme
    }
}
