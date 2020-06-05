//
//  Utilities.swift
//  customauth
//
//  Created by Christopher Ching on 2019-05-09.
//  Copyright © 2019 Christopher Ching. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    static func startFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = .white
        button.layer.cornerRadius = 12.0
        button.tintColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        button.setImage(UIImage(named: "round"), for: .normal)
    }
    
    static func correctClicked(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.backgroundColor = #colorLiteral(red: 0.2, green: 0.6352941176, blue: 0.3490196078, alpha: 1)
        button.tintColor = .white
        button.setImage(UIImage(named: "correct"), for: .selected)
    }
    static func wrongClicked(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.backgroundColor = #colorLiteral(red: 0.9176470588, green: 0.262745098, blue: 0.2078431373, alpha: 1)
        button.tintColor = .white
        button.setImage(UIImage(named: "wrong"), for: .normal)
    }
    static func startButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.backgroundColor = .orange
        button.tintColor = .white
        button.layer.cornerRadius = 10.0
    }
    
    
}
