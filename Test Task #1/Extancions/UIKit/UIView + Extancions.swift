//
//  UIView + Extancions.swift
//  Test Task #1
//
//  Created by TestTest on 21.10.2022.
//

import UIKit

extension UIView {
    
    func addView(_ view: UIView) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
