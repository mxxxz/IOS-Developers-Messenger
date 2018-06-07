//
//  Appearance+NavigationBar.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 06.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension AppearanceController {
    func navigationBarSetup(){
        navigationItem.title = "Appearance"
        //color theme
        navigationController?.navigationBar.barTintColor = navBarBackgroundColorTheme
        navigationController?.navigationBar.tintColor = navBarTintColorTheme
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: navBarTitleTextAttributesColorTheme]
    }
}
