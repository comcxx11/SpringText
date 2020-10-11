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
    @IBOutlet weak var lbl_num1: SPLabel!
    @IBOutlet weak var lbl_num2: SPLabel!
    @IBOutlet weak var lbl_num3: SPLabel!
    @IBOutlet weak var lbl_num4: SPLabel!
    
    override func viewDidLoad() {
        lbl_num1.text(num: 1000000000)
        lbl_num2.text(num: 1000000000, showCurrency: true)
        lbl_num3.text(num: 1234567890)
        lbl_num4.setCurrency(symbol: "￦")
        lbl_num4.text(num: 1234567890, showCurrency:true)
        
        let newLabel = SPLabel(frame: CGRect(x: 50, y: 200, width: 100, height: 100))
        newLabel.text(num: 1203901293)
        self.view.addSubview(newLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

