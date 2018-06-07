//
//  DecorController.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 05.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

class AppearanceController: UIViewController {
    
    let switchLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        label.text = "COLOR THEME"
        label.textAlignment = .left
        return label
    }()
    
    let generalSwitchView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let dayLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Day Mode"
        return label
    }()
    
    let dayModeImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "day")
        return imageView
    }()
    
    let switchView: UISwitch = {
       let switchView = UISwitch()
        switchView.translatesAutoresizingMaskIntoConstraints = false
        
        
        if let colorTheme = UserColorThemeVariable{
            if colorTheme == "day" {
                switchView.isOn = false
            }else{
                switchView.isOn = true
            }
        }
        
        
        switchView.addTarget(self, action: #selector(handleChangeColorTheme), for: .valueChanged)
        return switchView
    }()
    
    let nightModeImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "night")
        return imageView
    }()
    let nightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Night Mode"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //navbar
        navigationBarSetup()
        //color theme
        view.backgroundColor = colorViewColorTheme
        nightLabel.textColor = textColorTheme
        dayLabel.textColor = textColorTheme
        generalSwitchView.backgroundColor = viewBackgroundColorTheme
        //anchors
        setupChangeColorThemeContainer()
    }
}
