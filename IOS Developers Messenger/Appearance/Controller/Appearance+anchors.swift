//
//  Appearance+anchors.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 07.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension AppearanceController{
    func setupChangeColorThemeContainer(){
        view.addSubview(switchLabel)
        view.addSubview(generalSwitchView)
        
        switchLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 84).isActive = true
        switchLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 10).isActive = true
        switchLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        switchLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        generalSwitchView.topAnchor.constraint(equalTo: switchLabel.bottomAnchor, constant: 5).isActive = true
        generalSwitchView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        generalSwitchView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        generalSwitchView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        generalSwitchView.addSubview(switchView)
        
        switchView.centerXAnchor.constraint(equalTo: generalSwitchView.centerXAnchor).isActive = true
        switchView.centerYAnchor.constraint(equalTo: generalSwitchView.centerYAnchor).isActive = true
        
        
        generalSwitchView.addSubview(dayModeImageView)
        
        dayModeImageView.centerYAnchor.constraint(equalTo: generalSwitchView.centerYAnchor).isActive = true
        dayModeImageView.rightAnchor.constraint(equalTo: switchView.leftAnchor, constant: -20).isActive = true
        dayModeImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        dayModeImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        generalSwitchView.addSubview(nightModeImageView)
        
        nightModeImageView.centerYAnchor.constraint(equalTo: generalSwitchView.centerYAnchor).isActive = true
        nightModeImageView.leftAnchor.constraint(equalTo: switchView.rightAnchor, constant: 20).isActive = true
        nightModeImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        nightModeImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        generalSwitchView.addSubview(dayLabel)
        
        dayLabel.rightAnchor.constraint(equalTo: dayModeImageView.leftAnchor, constant: -10).isActive = true
        dayLabel.centerYAnchor.constraint(equalTo: generalSwitchView.centerYAnchor).isActive = true
        
        generalSwitchView.addSubview(nightLabel)
        
        nightLabel.leftAnchor.constraint(equalTo: nightModeImageView.rightAnchor, constant: 10).isActive = true
        nightLabel.centerYAnchor.constraint(equalTo: generalSwitchView.centerYAnchor).isActive = true
    }
}
