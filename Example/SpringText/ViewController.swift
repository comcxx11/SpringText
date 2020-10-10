//
//  ViewController.swift
//  SpringText
//
//  Created by comcxx11 on 10/10/2020.
//  Copyright (c) 2020 comcxx11. All rights reserved.
//

import UIKit
import SpringText

class ViewController: UIViewController {
    @IBOutlet weak var lblTitle: SPLabel!
    
    override func viewDidLoad() {
        lblTitle.text(num: 28787123)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

