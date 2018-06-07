//
//  ChoiseColorMode.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 06.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

class ChoiseColorThemeMode{
    class func colorTheme(colorThemeMode: String){
        if colorThemeMode == "day"{
            //text color
            textColorTheme = .black
            //buttons
            buttonsTextColorTheme = UIColor(r: 0, g: 122, b: 255)
            //view background color
            viewBackgroundColorTheme = .white
            //color view
            colorViewColorTheme = UIColor(r: 239, g: 239, b: 244)
            //tableview background color
            tableViewBackgroundColorTheme = .white
            //time label text color theme
            timeLabelTextColorTheme = UIColor.darkGray
            //separator color theme
            separatorColorTheme = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
            //----------Navigation bar color theme
            //background
            navBarBackgroundColorTheme = UIColor(r: 247, g: 247, b: 247)
            //title text color
            navBarTitleTextAttributesColorTheme = .black
            //tint color
            navBarTintColorTheme = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
            //----------Tab bar color theme
            //background
            tabBarBackgroundColorTHeme = UIColor(r: 247, g: 247, b: 247)
            //tint color
            tabBarTintColorTheme = #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)
            
            //chat log bottom container send button image
            sendButtonImageByColorTheme = #imageLiteral(resourceName: "uploadBlack")
            
            //keyboard appearance by color theme
            keyboardAppearanceByColorTheme = .default
            
            //activity indicator style by color theme
            activityIndicatorByColorTheme = .gray
            
            //placeholder color theme
            placeholderColorTheme = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
        }else{
            //text color
            textColorTheme = .white
            //buttons
            buttonsTextColorTheme = .white
            //view background color
            viewBackgroundColorTheme = UIColor(r: 28, g: 28, b: 29)
            //color view
            colorViewColorTheme = .black
            //tableview background color
            tableViewBackgroundColorTheme = .black
            //time label text color theme
            timeLabelTextColorTheme = .white
            
            //separator color theme
            separatorColorTheme = .black
            //----------Navigation bar color theme
            //background
            navBarBackgroundColorTheme = UIColor(r: 10, g: 10, b: 11)
            //title text color
            navBarTitleTextAttributesColorTheme = .white
            //tint color
            navBarTintColorTheme = .white
            //----------Tab bar color theme
            //background
            tabBarBackgroundColorTHeme = UIColor(r: 10, g: 10, b: 11)
            //tint color
            tabBarTintColorTheme = .white
            
            //chat log bottom container send button image
            sendButtonImageByColorTheme = #imageLiteral(resourceName: "uploadWhite")
            
            //keyboard appearance by color theme
            keyboardAppearanceByColorTheme = .dark
            
            //activity indicator style by color theme
            activityIndicatorByColorTheme = .white
            
            placeholderColorTheme = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        }
    }

}
