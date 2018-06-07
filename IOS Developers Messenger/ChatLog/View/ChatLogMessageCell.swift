//
//  ChatLogMessageCell.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

class ChatLogMessageCell: UICollectionViewCell {
    //message view
    let textView : UITextView = {
        let tv = UITextView()
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        tv.textColor = .white
        tv.isScrollEnabled = false
        tv.isUserInteractionEnabled = false
        return tv
    }()
    //background of message
    let bubbleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 40, g: 40, b: 40)
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //tail of message
    let bubbleTailView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "rightTail")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    
    //Constraint for bubbleview width anchor
    var bubbleWidthAnchor: NSLayoutConstraint?
    //Constraint for bubbleview right anchor
    var bubbleViewRightAnchor: NSLayoutConstraint?
    //Constraint for bubbleview left anchor
    var bubbleViewLeftAnchor: NSLayoutConstraint?
    
    //Constraint for bubbleTailView right anchor
    var bubbleTailViewRightAnchor: NSLayoutConstraint?
    //Constraint for bubbleTailView left anchor
    var bubbleTailViewLeftAnchor: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(bubbleView)
        addSubview(bubbleTailView)
        addSubview(textView)
        
        //            --ios 9 constaints
        
        //-setup for change side of view
        
        //right anchor
        bubbleViewRightAnchor = bubbleView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15)
        bubbleViewRightAnchor?.isActive = true
        //left anchor
        bubbleViewLeftAnchor = bubbleView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15)
        bubbleViewLeftAnchor?.isActive = false
        
        
        //top
        bubbleView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        //width
        bubbleWidthAnchor = bubbleView.widthAnchor.constraint(equalToConstant: 200)
        bubbleWidthAnchor?.isActive = true
        //height
        bubbleView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        
        //-Tail image view
        //setup for change side of view
        //right anchor
        bubbleTailViewRightAnchor = bubbleTailView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -9)
        bubbleTailViewRightAnchor?.isActive = true
        
        //left anchor
        bubbleTailViewLeftAnchor = bubbleTailView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 7)
        bubbleTailViewLeftAnchor?.isActive = false
        
        //bottom
        bubbleTailView.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor).isActive = true
        //width
        bubbleTailView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        //height
        bubbleTailView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        
        // message view
        textView.leftAnchor.constraint(equalTo: bubbleView.leftAnchor, constant: 8).isActive = true
        textView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: bubbleView.rightAnchor, constant: -8).isActive = true
        textView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
