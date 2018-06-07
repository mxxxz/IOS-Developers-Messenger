//
//  MessagesController.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit
import Firebase

class MessagesController: UITableViewController {
    
    let cellID = "MessagesCellID"
    
    //default height for header
    var heightForAI:CGFloat = 100
    //active view in header
    var headerViewIsAI = true
    //timer for reloading
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //default color for table view
        tableView.backgroundColor = tableViewBackgroundColorTheme
        
        //Hidden
        navigationController?.navigationBar.isHidden = true
        view.isHidden = true
        //tabbar
        hidesBottomBarWhenPushed = false
        //observe
        handleObserveUserMessages()
        
        
        //navbar setup
        navigationBarSetup()
        
        //check user auth status
        handleCheckIfUserIsLoggedIn()
        //registration
        tableView.register(MessagesCell.self, forCellReuseIdentifier: cellID)
        //observer for handle color theme
        handleColorTheme()
    }
}

