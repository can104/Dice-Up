//
//  TextViewController.swift
//  Dice Up
//
//  Created by Can Akyurek on 07/02/16.
//  Copyright © 2016 Can Akyurek. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

    var textTo: String!
    var userPhoto: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = textTo
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
