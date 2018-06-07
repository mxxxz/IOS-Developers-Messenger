//
//  SendMessage Service.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import Firebase

class SendMessage {
    private init() {}
    
    static let shared = SendMessage()
    
    class func sendMessageFunc(input: String) {
        let ref = Database.database().reference().child("Messages")
        //create spec id for message
        let childRef = ref.childByAutoId()
        
        guard let toId = currentUserIdentifier else { return }
        
        let fromId = Auth.auth().currentUser!.uid
        let timeStamp:TimeInterval = Date().timeIntervalSince1970
        let values = ["text" : input, "toId": toId,"fromId" : fromId,"timeStamp" : timeStamp] as [String : Any]
        
        childRef.updateChildValues(values) { (error, ref) in
            if error != nil {
                print(error)
                return
            }
            let userMessagesRef = Database.database().reference().child("User-Messages").child(fromId)
            
            let messageId = childRef.key
            userMessagesRef.updateChildValues([messageId: 1])
            
            let recipientUserMessagesRef = Database.database().reference().child("User-Messages").child(toId)
            recipientUserMessagesRef.updateChildValues([messageId: 1])
        }
    }
}
