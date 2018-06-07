//
//  UIImageView.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit
//create cache obj
let imageCache = NSCache<AnyObject, AnyObject>()
//load image and caching
extension UIImageView {
    
    func loadImageUsingCacheWithUrlString(urlString: String) {
        //default nil to avoid flashing
        self.image = nil
        
        //check cache for image first
        if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = cachedImage
            return
        }
        
        //otherwise fire off a new download
        let localUrl = URL(string: urlString)
        
        let imageQueue = DispatchQueue.global(qos: .default)
        imageQueue.async {
            guard let url = localUrl, let imageData = try? Data(contentsOf: url) else {return}
            //after in main Thread
            DispatchQueue.main.async {
                
                if let donwloadedImage = UIImage(data: imageData) {
                    
                    imageCache.setObject(donwloadedImage, forKey: urlString as AnyObject)
                    
                    self.image = donwloadedImage
                }
                
                
            }
        }
    }
}
