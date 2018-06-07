//
//  TouchesBegan.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension UIViewController{
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
