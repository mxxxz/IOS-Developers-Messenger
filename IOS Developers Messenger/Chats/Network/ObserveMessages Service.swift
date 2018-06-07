//
//  ObserveMessages Service.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import Firebase
class ObserveMessages {
    private init() {}
    
    static let shared = ObserveMessages()
    //check for auth user messages
    class func checkForMessages(onSuccess: @escaping (Bool)-> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        
        Database.database().reference().child("User-Messages").observeSingleEvent(of: .value, with: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                if dictionary[uid] != nil {
                    onSuccess(true)
                    return
                }else{
                    onSuccess(false)
                    return
                }
            }
        }, withCancel: nil)
        
    }
    
    class func observeActiveUserMessages(onSuccess: @escaping (Bool)-> Void) {
        //reset arrays
        messages.removeAll()
        MessagesDictionary.removeAll()
        

        //Make visible status bar network activity indicator
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        guard let userId = Auth.auth().currentUser?.uid else { return }
        let ref = Database.database().reference().child("User-Messages").child(userId)
        
        ref.observe(.childAdded, with: { (snapshot) in
            let messageId = snapshot.key
            
            let messageReference = Database.database().reference().child("Messages").child(messageId)
            messageReference.observeSingleEvent(of: .value, with: { (snapshot) in
                
                if let dictionary = snapshot.value as? [String:AnyObject] {
                    guard let fromId = dictionary["fromId"], let text = dictionary["text"],let timeStamp = dictionary["timeStamp"],let toId = dictionary["toId"]  else { return }
                    
                    //init
                    let message = Message.init(fromId: fromId as! String, text: text as! String, timeStamp: timeStamp as! TimeInterval, toId: toId as! String)
                    //apend to array
                    messages.append(message)
                    
                    //group
                    
                    MessagesDictionary[message.chatPartnerID() as! String] = message
                    
                    messages = Array(MessagesDictionary.values)
                    //sorted
                    messages.sort(by: { (message1, message2) -> Bool in
                        return Int(message1.timeStamp) > Int(message2.timeStamp)
                    })
                }
                
                onSuccess(true)
                //Make visible status bar network activity indicator
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                
            }, withCancel: nil)
        }, withCancel: nil)
        }
    
    
    }

