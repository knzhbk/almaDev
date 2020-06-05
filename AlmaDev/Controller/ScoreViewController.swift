//
//  ScoreViewController.swift
//  AlmaDev
//
//  Created by Arman Tursynbek on 6/3/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import MBCircularProgressBar

class ScoreViewController: UIViewController {
   var  score : Score?
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var progressView: MBCircularProgressBarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let score = score {
            scoreLabel.text = String(score.score)
            categoryLabel.text = score.subject
        }
        self.progressView.value = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 10.0) {
            self.progressView.value = CGFloat(self.score!.score)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
