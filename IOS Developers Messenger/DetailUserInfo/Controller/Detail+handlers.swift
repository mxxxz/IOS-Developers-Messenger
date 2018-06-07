//
//  Detail+handlers.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 07.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension DetailUserInfoController{
    //handle color theme changed
    func handleColorTheme(){
        ColorObserver.observerChangeColorTheme { (Result) in
            if Result {
                self.navigationBarSetup()
                self.view.backgroundColor = colorViewColorTheme
            }
        }

    }
}
