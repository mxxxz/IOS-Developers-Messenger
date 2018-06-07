//
//  ProfileCell.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 05.06.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        //indicator
        accessoryType = .disclosureIndicator
        //selection style
        selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
