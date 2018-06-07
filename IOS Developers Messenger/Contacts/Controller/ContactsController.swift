//
//  ContactsController.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit


class ContactsController: UITableViewController{
    
    let cellId = "ContactsCellId"
    //default height for header
    var heightForAI:CGFloat = 100
    //timer for reload tableView
    var timer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //default color for table view
        tableView.backgroundColor = tableViewBackgroundColorTheme
        //tabbar
        hidesBottomBarWhenPushed = false
        //nav
        navigationBarSetup()
        //load users data
        handleFetchAllUsersData()
        //Registration
        tableView.register(ContactsCell.self, forCellReuseIdentifier: cellId)
        
        //Make visible status bar network activity indicator
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        //observer for handle color theme
        handleColorTheme()
    }

}

