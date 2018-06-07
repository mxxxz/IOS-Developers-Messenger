//
//  Appearance+handlers.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 05.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension AppearanceController {
    //handle change color theme
    @objc func handleChangeColorTheme(){
        if switchView.isOn{
            UserColorThemeVariable = "night"
        }else{
            UserColorThemeVariable = "day"
        }
        if let newColorTheme = UserColorThemeVariable {
            ChoiseColorThemeMode.colorTheme(colorThemeMode: newColorTheme)
            //update in firebase
            ChangeUserColorTheme.updateColorTheme(newColorTheme: newColorTheme)
        }
        //reload self view(simple way)
        self.viewDidLoad()
        }
    }
