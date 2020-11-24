//
//  DesignView.swift
//  Breathe
//
//  Created by Jose Alarcon Chacon on 11/24/20.
//

import Foundation
import UIKit

@IBDesignable class DesignView: UIView {
    
    var cornerRadius: CGFloat = 16
    var shadowColor: UIColor = UIColor.black
    
    let shadowOffSetWidth: Int = 0
    let shadowOffSetHeight: Int = Int(0.5)
    
    var shadowOpacity: Float = 0.2
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
        
        let path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowPath = path.cgPath
        layer.shadowOpacity = shadowOpacity
        
    }
}
