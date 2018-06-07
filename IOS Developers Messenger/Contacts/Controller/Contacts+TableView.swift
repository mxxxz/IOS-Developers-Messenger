//
//  Contacts+TableView.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit
import Firebase

extension ContactsController{
    //Table View Defaults
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatLog = ChatLogController(collectionViewLayout: UICollectionViewFlowLayout())

        let user = users[indexPath.row]
        //post data to chatLog
        chatLog.user = user
        //push
        self.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(chatLog, animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    //height of cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    //cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? ContactsCell
        
        let user = users[indexPath.row]
        cell?.textLabel?.text = user.name
        //font
        cell?.textLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        cell?.backgroundColor = tableViewBackgroundColorTheme
        //observer for handle color theme
        ColorObserver.observerChangeColorTheme { (Result) in
            if Result{
                cell?.backgroundColor = tableViewBackgroundColorTheme
            }
        }
        //image url
        cell?.profileAvatar.loadImageUsingCacheWithUrlString(urlString: user.profileAvatar)
        return cell!
    }
    
    //header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let ai = UIActivityIndicatorView(activityIndicatorStyle: activityIndicatorByColorTheme!)
        ai.isHidden = false
        ai.startAnimating()
        return ai
    }
    //header view
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return heightForAI
    }
    
}
