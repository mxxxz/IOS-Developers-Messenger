//
//  Messages+TableView.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit
import Firebase

extension MessagesController{
    
    //table view
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatLog = ChatLogController(collectionViewLayout: UICollectionViewFlowLayout())

            let message = messages[indexPath.row]
            guard let chatPartnerID = message.chatPartnerID() else { return }
            //observe
            let ref = Database.database().reference().child("Users").child(chatPartnerID)
            
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                guard let dictionary = snapshot.value as? [String:AnyObject] else { return }
                
                let userId = snapshot.key as? String
                //prepare for init
                guard let name = dictionary["name"], let email = dictionary["email"], let profileAvatar = dictionary["profileAvatar"],let profileIdentifier = userId, let bio = dictionary["bio"] else { return }
                //init
                let user = ContactsUser.init(name: name as! String, email: email as! String, profileAvatar: profileAvatar as! String,profileIdentifier: profileIdentifier, bio: bio as! String)
                //send info about user
                user.profileIdentifier = chatPartnerID
                chatLog.user = user
                
                //push
                self.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(chatLog, animated: true)
                self.hidesBottomBarWhenPushed = false
                
            }, withCancel:  nil)
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    //cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? MessagesCell
        
        let message = messages[indexPath.row]
        
        cell?.message = message
        cell?.backgroundColor = tableViewBackgroundColorTheme
        //observer for handle color theme
        ColorObserver.observerChangeColorTheme { (Result) in
            if Result{
                cell?.backgroundColor = tableViewBackgroundColorTheme
            }
        }
        return cell!
    }
    //header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if headerViewIsAI{
            let ai = UIActivityIndicatorView(activityIndicatorStyle: activityIndicatorByColorTheme!)
            ai.isHidden = false
            ai.startAnimating()
            return ai
        }else{
            let label = UILabel()
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 24)
            label.text = "NO CHATS"
            return label
        }

    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return heightForAI
    }
}
