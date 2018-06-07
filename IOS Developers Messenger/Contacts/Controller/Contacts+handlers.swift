//
//  Contacts+handlers.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension ContactsController {
    //load all users in table view
    func handleFetchAllUsersData(){
        FetchUsers.fetchUsersData { (Result) in
            if Result{
                //invalidate timer
                self.timer?.invalidate()
                //create timer setup by target to reload
                self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.reloadTableView), userInfo: nil, repeats: false)
            }
        }
    }
    @objc private func reloadTableView(){
        //Make unvisible status bar network activity indicator
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        //disable header AI
        self.heightForAI = 0
        //reload
        self.tableView.reloadData()
    }
    //handle color theme changed
    func handleColorTheme(){
        //observer for handle color theme
        ColorObserver.observerChangeColorTheme { (Result) in
            if Result{
                self.navigationBarSetup()
                self.tabBarLocalSetup()
                
                self.tableView.backgroundColor = tableViewBackgroundColorTheme
            }
        }
    }
}

