//
//  Utils.swift
//  Dice Up
//
//  Created by Can Akyurek on 06/02/16.
//  Copyright © 2016 Can Akyurek. All rights reserved.
//

import UIKit

class Utils {
    
    class func showMessage(viewController: UIViewController, title: String, message: String?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { [unowned viewController] action in
            
            viewController.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        viewController.presentViewController(alert, animated: true, completion: nil)
    }
    
    class func showActionSheet(viewController: UIViewController, imagePicker picker: UIImagePickerController) {
        
        let alert = UIAlertController(title: "", message: "", preferredStyle: .ActionSheet)
        alert.addAction(UIAlertAction(title: "Photo Library", style: .Default, handler: { action in
            picker.sourceType = .PhotoLibrary
            viewController.presentViewController(picker, animated: true, completion: nil)
            }))
        
        alert.addAction(UIAlertAction(title: "Take Photo", style: .Default, handler: { action in
            picker.sourceType = .Camera
            viewController.presentViewController(picker, animated: true, completion: nil)
            }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: { action in
            picker.dismissViewControllerAnimated(true, completion: nil)
            }))
        
        viewController.presentViewController(alert, animated: true, completion: nil)
    }
}

