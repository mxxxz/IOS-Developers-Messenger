//
//  CustomTabBarController.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // setup our custom view controllers
        let messagesController = UINavigationController(rootViewController: MessagesController())
        messagesController.tabBarItem.title = "Chats"
        messagesController.tabBarItem.image = UIImage(named: "chat")

        let profileController = UINavigationController(rootViewController: ProfileController())
        profileController.tabBarItem.title = "Settings"
        profileController.tabBarItem.image = UIImage(named: "settings")

        let сontactsController = UINavigationController(rootViewController: ContactsController())
        сontactsController.tabBarItem.title = "Contacts"
        сontactsController.tabBarItem.image = UIImage(named: "сontacts")


        viewControllers = [сontactsController,messagesController, profileController]

        //default tab bar settings
        selectedIndex = 1
        //color theme
        tabBar.tintColor = tabBarTintColorTheme
        tabBar.barTintColor = tabBarBackgroundColorTHeme
    }

}
