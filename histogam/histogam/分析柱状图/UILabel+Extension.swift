//
//  UILabel+Extension.swift
//  AgricultureGeek
//
//  Created by 每天农资 on 2017/4/20.
//  Copyright © 2017年 每天农资. All rights reserved.
//

import UIKit

extension UILabel {
    
    func setUI(font: CGFloat, textColor: String, typeface: TypeFace = .Medium) {
        
        self.textColor = UIColor(hexColor: textColor)
        if typeface == .Bold {
            self.font = UIFont.boldSystemFont(ofSize: font)
        }else if typeface == .Medium{

            self.font = UIFont.systemFont(ofSize: font)
        }else {
            self.font = UIFont.systemFont(ofSize: font)
            
        }
    }
    
}

enum TypeFace: String {
    case Bold
    case Medium
    case Light
}

extension UIButton {
    
    func addTarget(_ target: Any?, action: Selector) {
        
        self.addTarget(target, action: action, for: .touchUpInside)
    }
    
    func setupUI(font: CGFloat, title: String, textColor: String, backColor: String, target: Any?, selector: Selector, for controlEvents: UIControlEvents = .touchUpInside) {
        
        self.setupUI(font: font, title: title, textColor: textColor, backColor: backColor)
        self.addTarget(target, action: selector, for: controlEvents)
    }
    
    func setupUI(font: CGFloat, title: String, textColor: String, backColor: String) {
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(UIColor(hexColor: textColor), for: .normal)
        self.backgroundColor = UIColor(hexColor: backColor)
        self.titleLabel?.font = UIFont.systemFont(ofSize: font)
    }
    
    func 圆角(_ px: CGFloat) {
        self.layer.cornerRadius = px
        self.layer.masksToBounds = true
    }
}
