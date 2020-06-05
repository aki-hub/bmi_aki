//
//  UITextField+Extension.swift
//  BMI1
//
//  Created by 山田隼也 on 2020/06/05.
//  Copyright © 2020 高見明伸. All rights reserved.
//

import UIKit

extension UITextField {
    func addBorderBottom(height: CGFloat, coler: UIColor) {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: self.frame.height - height, width: self.frame.width, height: height)
        border.backgroundColor = coler.cgColor
        self.layer.addSublayer(border)
    }
}
