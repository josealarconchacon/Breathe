//
//  ButtonUI.swift
//  Breathe
//
//  Created by Jose Alarcon Chacon on 11/27/20.
//

import Foundation
import UIKit

extension UIButton {
    func button_ui() {
        layer.backgroundColor = UIColor.clear.cgColor
        layer.cornerRadius = 20
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.black.cgColor
    }
}
