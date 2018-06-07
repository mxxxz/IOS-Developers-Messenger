//
//  ChatLog+CollectionView.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit
import Firebase

extension ChatLogController {
    //delegate
    // The specified item should be selected.
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    //end editing for user
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.view.endEditing(true)
    }
    
    //collectionView setup
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chatLogMessages.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? ChatLogMessageCell
        
        let message = chatLogMessages[indexPath.row]
        cell?.textView.text = message.text
        
        setupCell(cell: cell!, message: message)
        
        //width of bubble view
        cell?.bubbleWidthAnchor?.constant = estimateFrameForText(text: message.text).width + 32
        
        
        //reserve for cell
        cell?.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        
        
        return cell!
    }
    //change setup for messages from another user
    private func setupCell(cell: ChatLogMessageCell, message: Message){
        if message.fromId == Auth.auth().currentUser?.uid {
            //outgoing
            cell.bubbleView.backgroundColor = UIColor(r: 40, g: 40, b: 40)
            cell.textView.textColor = .white
            //position
            cell.bubbleViewRightAnchor?.isActive = true
            cell.bubbleViewLeftAnchor?.isActive = false
            
            //tail
            cell.bubbleTailViewRightAnchor?.isActive = true
            cell.bubbleTailViewLeftAnchor?.isActive = false
            //tail image
            cell.bubbleTailView.image = #imageLiteral(resourceName: "rightTail")
        }else{
            //incoming
            cell.bubbleView.backgroundColor = .white
            cell.textView.textColor = .black
            //position
            cell.bubbleViewRightAnchor?.isActive = false
            cell.bubbleViewLeftAnchor?.isActive = true
            
            //tail
            cell.bubbleTailViewRightAnchor?.isActive = false
            cell.bubbleTailViewLeftAnchor?.isActive = true
            //tail image
            cell.bubbleTailView.image = #imageLiteral(resourceName: "leftTail")
        }
    }
    
    //size for cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var height: CGFloat = 80
        
        if chatLogMessages[indexPath.item] != nil {
            height = estimateFrameForText(text: chatLogMessages[indexPath.item].text).height + 18
        }
        
        return CGSize(width: view.frame.width, height: height)
    }
    //get correct text size
    private func estimateFrameForText(text: String) -> CGRect {
        
        let size = CGSize(width: 200, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 16)], context: nil)
    }
    
}
