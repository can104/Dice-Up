//
//  ProfileViewController.swift
//  Dice Up
//
//  Created by Can Akyurek on 12/01/16.
//  Copyright © 2016 Can Akyurek. All rights reserved.
//

import UIKit
import ParseFacebookUtilsV4
import SVProgressHUD

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    var pictureView: FBSDKProfilePictureView!
    let picker = UIImagePickerController()
    var modelUser: User! {
        didSet {
            
            nameLabel.text = "\(modelUser.name) \(modelUser.surname)"
            let name = "\(modelUser.name) \(modelUser.surname)"
            getProfilePicture()
//            var firebaseUsers = [NSDictionary]()
//            let info = ["name": name, "imageURL": "http://graph.facebook.com/\(modelUser.profileId)/picture?type=large"]
//
//            firebaseUsers.append(info)
//
//            firebaseReference.childByAppendingPath("users").setValue(info)

        }
    }
    
    @IBAction func changeImageTapped(sender: UIButton) {
        
        Utils.showActionSheet(self, imagePicker: picker)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SVProgressHUD.setDefaultMaskType(.Black)
        
        picker.allowsEditing = true
        picker.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        getFacebookInfo()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getProfilePicture() {
            pictureView = FBSDKProfilePictureView(frame: CGRect(x: 85, y: 20, width: 150, height: 150))
            SVProgressHUD.show()
        
            pictureView.profileID = "me"
            pictureView.pictureMode = .Square
            pictureView.roundImageView()
            view.addSubview(pictureView)
            SVProgressHUD.dismiss()
    }
    
    func getFacebookInfo() {
        let fbRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, first_name, last_name"])
        
        fbRequest.startWithCompletionHandler { [unowned self] (connection, result, error) -> Void in
            
            // Obtain the result as NSDictionary
            if let fbData = result as? NSDictionary {
                
                // Assign the dictionary values to model properties
                self.modelUser = User(JSON: fbData)

            } else {
                print(error.localizedDescription)
            }
        }
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            profileView.contentMode = .ScaleToFill
            pictureView = nil
            profileView.image = pickedImage
            profileView.roundImageView()
            
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}

