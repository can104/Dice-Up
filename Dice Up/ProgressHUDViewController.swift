//
//  ProgressHUDViewController.swift
//  Dice Up
//
//  Created by Can Akyurek on 06/02/16.
//  Copyright © 2016 Can Akyurek. All rights reserved.
//

import UIKit
import SVProgressHUD

class ProgressHUDViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.setDefaultMaskType(.Black)
        SVProgressHUD.show()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        SVProgressHUD.dismiss()
    }
}
