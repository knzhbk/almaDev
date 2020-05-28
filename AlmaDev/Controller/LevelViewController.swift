//
//  LevelViewController.swift
//  AlmaDev
//
//  Created by Apple on 5/29/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class LevelViewController: UIViewController {
    
    var category: Category?

    @IBOutlet weak var categoryLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let category = category{
            categoryLabel.text = category.categoryName
        }

    
    }
    


}
