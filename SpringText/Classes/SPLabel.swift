//
//  SPLabel.swift
//  SpringText
//
//  Created by xeozin on 2020/10/10.
//

import UIKit

open class SPLabel: UILabel {
    var fullText = ""
    private var hasWon: Bool = true
    
    private var scrollLayers: [CAScrollLayer] = []
    private var scrollLabels: [UILabel] = []
    private let duration = 0.7
    private let durationOffset = 0.2
    private let textsNotAnimated = [","]
    
    public func text(num: Int, hasWon: Bool = true) {
        self.hasWon = hasWon
        self.configure(with: num)
        self.animate()
    }
    
    public func configure(with number: Int) {
        let text = number.currency
        fullText = text
        clean()
        setupSubviews()
    }
    
    private func animate(ascending: Bool = true) {
        createAnimations(ascending: ascending)
    }
    
    private func clean() {
        self.text = nil
        self.subviews.forEach { $0.removeFromSuperview() }
        self.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        scrollLayers.removeAll()
        scrollLabels.removeAll()
    }
    
    private func setupSubviews() {
        let stringArray = fullText.map { String($0) }
        var x: CGFloat = 0
        let y: CGFloat = 0
        if self.textAlignment == .center {
            if hasWon {
                self.text = "￦ \(fullText)"
            } else {
                self.text = fullText
            }
            let w = UILabel.textWidth(font: self.font, text: self.text ?? "")
            self.text = ""          // 초기화
            x = -(w / 2)
        } else if self.textAlignment == .right {
            if hasWon {
                self.text = "￦ \(fullText)"
            } else {
                self.text = fullText
            }
            let w = UILabel.textWidth(font: self.font, text: self.text ?? "")
            self.text = ""          // 초기화
            x = -w
        }
        
        if hasWon {
            let wLabel = UILabel()
            wLabel.frame.origin = CGPoint(x: x, y: y)
            wLabel.textColor = textColor
            wLabel.font = font
            wLabel.text = "￦ "
            wLabel.textAlignment = .center
            wLabel.sizeToFit()
            self.addSubview(wLabel)
            x += wLabel.bounds.width
        }
        
        stringArray.enumerated().forEach { index, text in
            if textsNotAnimated.contains(text) {
                // 콤마
                let label = UILabel()
                label.frame.origin = CGPoint(x: x, y: y)
                label.textColor = textColor
                label.font = font
                label.text = text
                label.textAlignment = .center
                label.sizeToFit()
                self.addSubview(label)
                
                x += label.bounds.width
            } else {
                // 숫자
                let label = UILabel()
                label.frame.origin = CGPoint(x: x, y: y)
                label.textColor = textColor
                label.font = font
                label.text = "0"
                label.textAlignment = .center
                label.sizeToFit()
                createScrollLayer(to: label, text: text)
                
                x += label.bounds.width
            }
        }
    }
    
    private func createScrollLayer(to label: UILabel, text: String) {
        let scrollLayer = CAScrollLayer()
        scrollLayer.frame = label.frame
        scrollLayers.append(scrollLayer)
        self.layer.addSublayer(scrollLayer)
        
        createContentForLayer(scrollLayer: scrollLayer, text: text)
    }
    
    private func createContentForLayer(scrollLayer: CAScrollLayer, text: String) {
        var textsForScroll: [String] = []
        guard let number = Int(Int(text)?.currency ?? "0") else { return }
        textsForScroll.append("0")
        for i in 0...9 {
            let str = String((number + i) % 10)
            textsForScroll.append(Int(str)?.currency ?? "0")
        }
        textsForScroll.append(text)
        
        var height: CGFloat = 0
        for text in textsForScroll {
            let label = UILabel()
            label.text = text
            label.textColor = textColor
            label.font = font
            label.textAlignment = .center
            label.frame = CGRect(x: 0, y: height, width: scrollLayer.frame.width, height: scrollLayer.frame.height)
            scrollLayer.addSublayer(label.layer)
            scrollLabels.append(label)
//            height = label.frame.maxY + 5
            height = label.frame.maxY
        }
    }
    
    private func createAnimations(ascending: Bool) {
        var offset: CFTimeInterval = 0.0
        
        for scrollLayer in scrollLayers {
            let maxY = scrollLayer.sublayers?.last?.frame.origin.y ?? 0.0
            
            let animation = CABasicAnimation(keyPath: "sublayerTransform.translation.y")
            animation.duration = duration + offset
            animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
            
            if ascending {
                animation.fromValue = maxY
                animation.toValue = 0
            } else {
                animation.fromValue = 0
                animation.toValue = maxY
            }
            
            scrollLayer.scrollMode = .vertically
            // custom key 설정
            scrollLayer.add(animation, forKey: nil)
            scrollLayer.scroll(to: CGPoint(x: 0, y: maxY))
            
            offset += self.durationOffset
        }
    }
}
