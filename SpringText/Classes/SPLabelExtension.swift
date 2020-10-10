//
//  SPLabelExtension.swift
//  SpringText
//
//  Created by seojin on 2020/10/11.
//

import UIKit

extension UILabel {
    func textWidth() -> CGFloat {
        return UILabel.textWidth(label: self)
    }
    
    class func textWidth(label: UILabel) -> CGFloat {
        return textWidth(label: label, text: label.text!)
    }
    
    class func textWidth(label: UILabel, text: String) -> CGFloat {
        return textWidth(font: label.font, text: text)
    }
    
    class func textWidth(font: UIFont, text: String) -> CGFloat {
        let myText = text as NSString
        
        let rect = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        let labelSize = myText.boundingRect(with: rect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(labelSize.width)
    }
}

extension Int {
    var currency: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
//        numberFormatter.locale = App.shared.locale
        numberFormatter.maximumFractionDigits = 0
        return numberFormatter.string(from: NSNumber(value: self))?.currency ?? "0"
    }
}

extension String {
    var currency: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
//        formatter.locale = App.shared.locale
        formatter.maximumFractionDigits = 0
        
        let currencyString = formatter.string(from: formatter.number(from: self) ?? 0) ?? "0"
        //        currencyString = currencyString + "원"
        
        return currencyString
    }
    
}
