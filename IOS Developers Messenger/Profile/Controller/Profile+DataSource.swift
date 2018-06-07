//
//  Profile+DataSource.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 05.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension ProfileController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Appearance = AppearanceController()
        self.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(Appearance, animated: true)
        self.hidesBottomBarWhenPushed = false
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ProfileCell
        
        cell.imageView?.image = #imageLiteral(resourceName: "decorIcon")
        
        cell.textLabel?.text = "Appearance"
        //default cell color setup
        if UserColorThemeVariable == "night" {
            cell.backgroundColor = viewBackgroundColorTheme
            cell.textLabel?.textColor = textColorTheme
        }else{
            cell.backgroundColor = .white
            cell.textLabel?.textColor = .black
        }
        //observer
        ColorObserver.observerChangeColorTheme { (Result) in
            if Result{
                cell.backgroundColor = viewBackgroundColorTheme
                cell.textLabel?.textColor = textColorTheme
            }
        }
        if UserColorThemeVariable == "night" {
            cell.backgroundColor = viewBackgroundColorTheme
            cell.textLabel?.textColor = textColorTheme
        }else{
            cell.backgroundColor = .white
            cell.textLabel?.textColor = .black
        }
        
        return cell
    }
}
