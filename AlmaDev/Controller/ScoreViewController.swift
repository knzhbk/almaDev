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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utilities.startButton(restartTest)
        if let score = score {
            scoreLabel.text = String(score.score)
            categoryLabel.text = score.subject
            uploadScoreToFirebase(score: score)
        }
        
        self.progressView.value = 0
    }
    
    func uploadScoreToFirebase(score:Score) {
        let ref = Database.database().reference()
        ref.child("User01").child("scores").child("\(score.subject)").setValue(score.score)
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
