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
        super.viewDidLoad()
        lblTitle.text = "OK"
        lblTitle.updateDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

