//
//  SPLabel.swift
//  SpringText
//
//  Created by xeozin on 2020/10/10.
//

import UIKit

open class SPLabel: UILabel {
    public func updateDisplay() {
        self.text = "Update"
        self.sizeToFit()
    }
}
