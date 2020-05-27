//
//  ProgressViewController.swift
//  AlmaDev
//
//  Created by Apple on 5/27/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import MBCircularProgressBar
class ProgressViewController: UIViewController {

    @IBOutlet weak var progressResult: MBCircularProgressBarView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.progressResult.value = 0

      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 3)
        {
            
            self.progressResult.value = 49
    }
    

}
}
