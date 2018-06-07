//
//  ChatLogController.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit
import Firebase


class ChatLogController: UICollectionViewController, UITextFieldDelegate, UICollectionViewDelegateFlowLayout{

    //timer for reload collection view
    var timer:Timer?

    //cell id
    let cellId = "ChatLogCellId"
    //user Class
    var user: ContactsUser? {
        didSet{
            navigationItem.title = user?.name
            
            currentUserIdentifier = user?.profileIdentifier
            
            guard let userImage = user?.profileAvatar else { return }
            //nav setup
            navigationBarSetup(userImage: userImage)
            
            //--observe reset
            //Remove the observer
            userMessagesRef?.removeObserver(withHandle: chatLogObserver!)
            //remove all messages
            chatLogMessages.removeAll()
            
            //--observer
            //observe reload
            handleObserve()
            //handle user input for animate
            handleUserInput()
            
        }
    }
    //global background image view
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Background0")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    //container view
    let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = viewBackgroundColorTheme
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    //text view for input user message
    lazy var inputTextField: UITextField = {
        //InputTextField setup
        let TextField = UITextField()
        //padding
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 50))
        TextField.leftView = paddingView
        TextField.leftViewMode = UITextFieldViewMode.always
        //inputTF
        TextField.translatesAutoresizingMaskIntoConstraints = false
        TextField.layer.cornerRadius = 15
        TextField.clipsToBounds = true
        TextField.layer.borderWidth = 0.5
        TextField.layer.borderColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
        TextField.backgroundColor = viewBackgroundColorTheme
        TextField.tintColor = buttonsTextColorTheme
        TextField.textColor = textColorTheme
        TextField.attributedPlaceholder = NSAttributedString(string: "Message...", attributes: [NSAttributedStringKey.foregroundColor: placeholderColorTheme])
        //keyboard type
        TextField.keyboardAppearance = keyboardAppearanceByColorTheme!
        //delegate
        TextField.delegate = self
        //action
        TextField.addTarget(self, action: #selector(handleUserInput), for: .editingChanged)
        
        return TextField
    }()
    
    let sendButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(sendButtonImageByColorTheme, for: .normal)
        button.alpha = 0
        button.addTarget(self, action: #selector(handleSend), for: .touchUpInside)
        return button
    }()
    
    
    func collectionViewSetup() {
        //reserve cells
        collectionView?.transform = CGAffineTransform.init(rotationAngle: (-(CGFloat)(Double.pi)))
        
        //default color
        collectionView?.backgroundColor = viewBackgroundColorTheme
        //always scroll vertical
        collectionView?.alwaysBounceVertical = true
        //create a little space on top anchor
        collectionView?.contentInset = UIEdgeInsets(top: -8, left: 0, bottom: 70, right: 0)
        //setup for scroll indicator
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: -13, left: 0, bottom: 65, right: 0)
        
        //collection view background view
        collectionView?.backgroundView = backgroundImageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //collection view setup
        collectionViewSetup()
        
        //bottom input view
        setupInputComponents()
        
        
        //keyboard notification
        handleKeyboard()
        
        //register cell
        collectionView?.register(ChatLogMessageCell.self, forCellWithReuseIdentifier: cellId)
        
        //observer for handle color theme
        handleColorTheme()
    }
    

    
    //send message by return button(IOS)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if handleUserInput(){
            handleSend()
        }
        return true
    }
    
}
