//
//  ObserverChatLog Service.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 02.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import Firebase


class ObserveChatLog {
    private init() {}
    
    static let shared = ObserveChatLog()
    
    
    class func observeCurrentUserMessages(userIdetifier: String,onSuccess: @escaping (Bool) -> Void) {
        //clear the array
        chatLogMessages.removeAll()
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        userMessagesRef = Database.database().reference().child("User-Messages").child(uid)
        
        //observer
        chatLogObserver = userMessagesRef?.observe(.childAdded, with: { (snapshot) in
            let messageId = snapshot.key
            let messagesRef = Database.database().reference().child("Messages").child(messageId)
            
            messagesRef.observeSingleEvent(of: .value, with: { (snapshot) in
                guard let dictionary = snapshot.value as? [String: AnyObject] else { return }
                
                guard let fromId = dictionary["fromId"], let text = dictionary["text"],let timeStamp = dictionary["timeStamp"],let toId = dictionary["toId"]  else { return }
                
                //init
                let message = Message.init(fromId: fromId as! String, text: text as! String, timeStamp: timeStamp as! TimeInterval, toId: toId as! String)
                
                if message.chatPartnerID() == userIdetifier{
                    chatLogMessages.insert(message, at: 0)
                    onSuccess(true)
                }
                
            }, withCancel: nil)
        }, withCancel: nil)
        
        
        
    }
    
    
    
}
