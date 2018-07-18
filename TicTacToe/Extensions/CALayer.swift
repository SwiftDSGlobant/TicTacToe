//
//  CALayer.swift
//  TicTacToe
//
//  Created by Aldo Antonio Martinez Avalos on 04/07/18.
//  Copyright © 2018 Aldo Avalos. All rights reserved.
//

import UIKit

extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        switch edge {
        case .top:
            border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: thickness)
        case .bottom:
            border.frame = CGRect(x: 0, y: frame.size.height - thickness, width: frame.size.width, height: thickness)
        case .left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: frame.size.height)
        case .right:
            border.frame = CGRect(x: 0, y: frame.size.width - thickness, width: thickness, height: frame.size.height)
        default:
            break
        }
        border.backgroundColor = color.cgColor;
        addSublayer(border)
    }
    
}
