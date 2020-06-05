//
//  ScoreViewController.swift
//  AlmaDev
//
//  Created by Arman Tursynbek on 6/3/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
   var  score : Score?
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let score = score {
            scoreLabel.text = String(score.score)
            categoryLabel.text = score.subject
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
