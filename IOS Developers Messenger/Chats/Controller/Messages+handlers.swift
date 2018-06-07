//
//  Messages+handlers.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit
import Firebase

extension MessagesController {
    
    @objc private func reloadTableView(){
        DispatchQueue.main.async {
            print("RELOADING")
            //Make unvisible status bar network activity indicator
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            self.tableView.reloadData()
            
        }
    }
    @objc func handleObserveUserMessages() {
        ObserveMessages.checkForMessages { (Result) in
            if Result{
                ObserveMessages.observeActiveUserMessages(onSuccess: { (Observe) in
                    if Observe{
                        //hide header
                        self.heightForAI = 0
                        self.timer?.invalidate()
                        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.reloadTableView), userInfo: nil, repeats: false)
                    }
                })
            }else{
                self.headerViewIsAI = false
                self.reloadTableView()
                //move on observe
                ObserveMessages.observeActiveUserMessages(onSuccess: { (Observe) in
                    if Observe{
                        //hide header
                        self.heightForAI = 0
                        self.timer?.invalidate()
                        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.reloadTableView), userInfo: nil, repeats: false)
                    }
                })
            }
        }
        ObserveMessages.observeActiveUserMessages { (Result) in
            if Result{
                
                self.timer?.invalidate()
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.reloadTableView), userInfo: nil, repeats: false)
                
                //disable header AI
                self.heightForAI = 0
            }
        }
    }
    
    
    
    
    //Check logged in status
    func handleCheckIfUserIsLoggedIn(){
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(handleSession), with: nil, afterDelay: 0)
        }else{
            //Hidden
            view.isHidden = false
            navigationController?.navigationBar.isHidden = false
        }
    }
    //Present auth controller if user not sign in
    @objc func handleSession() {
        //present to auth controller
        let authController = AuthController()
        present(authController, animated: true, completion: nil)
    }
    
    //handle color theme changed
    func handleColorTheme(){
        ColorObserver.observerChangeColorTheme { (Result) in
            if Result{
                self.tableView.backgroundColor = tableViewBackgroundColorTheme
                self.navigationBarSetup()
                self.tabBarLocalSetup()
            }
        }

    }
}
