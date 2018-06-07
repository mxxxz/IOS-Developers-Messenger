//
//  Message.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit
import Firebase

class Message: NSObject{
    var fromId: String
    var text: String
    var timeStamp: TimeInterval
    var toId: String
    
    required init(fromId: String,text:String,timeStamp:TimeInterval,toId:String) {
        self.fromId = fromId
        self.text = text
        self.timeStamp = timeStamp
        self.toId = toId
    }
    
    
    func chatPartnerID() -> String? {
        return fromId == Auth.auth().currentUser?.uid ? toId : fromId
    }
}
