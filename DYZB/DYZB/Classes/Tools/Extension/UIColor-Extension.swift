//
//  UIColor-Extension.swift
//  DYZB
//
//  Created by 王 on R 2/04/23.
//  Copyright © Reiwa 2 王. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b:CGFloat) {
        self.init(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1.0)
    }
}
