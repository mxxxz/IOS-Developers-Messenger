//
//  Profile+ImagePicker.swift
//  IOS Developers Messenger
//
//  Created by Dmitry Grusha on 27.05.2018.
//  Copyright © 2018 Dmitry Grusha. All rights reserved.
//

import UIKit

extension ProfileController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //Upload or change user Avatar
    @objc func handleSelectProfileImage(){
        let picker = UIImagePickerController()
        //change textColor to show button status
        profileChangeImage.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        
        picker.delegate = self
        
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage{
            selectedImageFromPicker = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            //Paste selected image to special variable
            UserProfileImageVariable = selectedImage
            
            UploadNewProfileImage.changeProfileImage { (Result) in
                if Result{
                    //Paste new image in view
                    self.profileImage.image = selectedImage
                }
            }
        }
        //change text color to default
        profileChangeImage.setTitleColor(buttonsTextColorTheme, for: .normal)
        //dismiss
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //change text color to default
        profileChangeImage.setTitleColor(buttonsTextColorTheme, for: .normal)
        //dismiss
        dismiss(animated: true, completion: nil)
    }
}
