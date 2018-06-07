//
//  ChatLog+Variables.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import Firebase

//dismiss last position
var dismissController:String = ""

//user data
var currentUser: String?//??

var currentUserIdentifier: String?

var chatLogMessages = [Message]()
    

//Database reference variable to remove all observers by dismiss
var userMessagesRef:DatabaseReference?

//
var chatLogObserver:UInt?
