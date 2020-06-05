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
        button.layer.cornerRadius = 25.0
        button.tintColor = .lightGray
        button.setImage(UIImage(named: "round"), for: .normal)
    }
    
    static func correctClicked(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.backgroundColor = .green
        button.tintColor = .white
        button.setImage(UIImage(named: "correct"), for: .normal)
    }
    static func wrongClicked(_ button:UIButton) {
          
          // Hollow rounded corner style
          button.backgroundColor = .red
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
