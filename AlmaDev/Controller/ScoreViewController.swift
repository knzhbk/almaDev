//
//  ScoreViewController.swift
//  AlmaDev
//
//  Created by Arman Tursynbek on 6/3/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import MBCircularProgressBar
import Firebase

class ScoreViewController: UIViewController {
    var  score : Score?
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var restartTest: UIButton!
    
    @IBOutlet weak var progressView: MBCircularProgressBarView!
    
    var outOfNumber = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.progressView.value = 0
        progressView.maxValue = 100
        self.navigationItem.setHidesBackButton(true, animated: true);
        Utilities.startButton(restartTest)
        if let score = score {
            categoryLabel.text = score.subject
            uploadScoreToFirebase(score: score)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        UIView.animate(withDuration: 5.0) {
            self.progressView.value = CGFloat(self.getPercentage())
            if let score = self.score {
                self.scoreLabel.text = "\(score.score)/\(self.outOfNumber)"
            }
        }
    }
    
    func getPercentage() -> Int {
        let level = UserDefaults.standard.string(forKey: "Level")
        var percentage = 0
        if let score = score {
            if level == "Easy" {
                self.outOfNumber = 100
                percentage = Int((Float(score.score) / 100.0) * 100.0)
            } else if level == "Medium" {
                //40 / 200 = 0,2 0,2 * 100 = 20
                self.outOfNumber = 200
                percentage = Int((Float(score.score) / 200.0) * 100.0)
            } else {
                self.outOfNumber = 300
                percentage = Int((Float(score.score) / 300.0) * 100.0)
            }
        }
    
        return percentage
    }
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func uploadScoreToFirebase(score:Score) {
        let ref = Database.database().reference()
        ref.child("User01").child("scores").child("\(score.subject)").setValue(score.score)
    }

   
}
 
