//
//  UIImage.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 03.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit
import CoreGraphics
//resize image
extension UIImage {
    func resizeImage(newHeight: CGFloat) -> UIImage {
//        let scale = newHeight / self.size.height
//        let newWidth = self.size.width * scale
        let newWidth = newHeight
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        self.draw(in: CGRect(x: 0, y: 0, width: newHeight, height: newHeight))
        
        if let newImage = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
        
            return newImage
        }else {
            return self
        }
        
    }
}
