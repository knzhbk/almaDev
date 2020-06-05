//
//  TestViewController.swift
//  AlmaDev
//
//  Created by Arman Tursynbek on 5/27/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import Firebase

class TestViewController: UIViewController {
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    var category = "Geography"
    var diffuculity = 2
    var numberOfQuestions = 5
    var number = 1
    var score = 0
    var answered = false
    var correctAnswer = "Correct"
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var numberOfQueLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? ScoreViewController
        destination?.score = Score(subject: category, score: score)
    }
    func writeQuestion(number : Int){
        let ref = Database.database().reference()
        ref.child("User01").child("\(number-1)").observeSingleEvent(of: .value)
            { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let category = value?["category"] as? String ?? ""
                self.category = category
            let question = value?["question"] as? String ?? ""
                self.questionLabel.text = question
            let correctAnswer = value?["correct_answer"] as? String ?? ""
                self.firstButton.setTitle(correctAnswer, for: .normal)
            let inCorrectAnswer0 = value?["incorrect_answers0"] as? String ?? ""
                self.secondButton.setTitle(inCorrectAnswer0, for: .normal)
            let inCorrectAnswer1 = value?["incorrect_answers1"] as? String ?? ""
                self.thirdButton.setTitle(inCorrectAnswer1, for: .normal)
            let inCorrectAnswer2 = value?["incorrect_answers2"] as? String ?? ""
                self.fourthButton.setTitle(inCorrectAnswer2, for: .normal)
            }
        Utilities.startFilledButton(firstButton)
        Utilities.startFilledButton(secondButton)
        Utilities.startFilledButton(thirdButton)
        Utilities.startFilledButton(fourthButton)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        firstConfig()
        title = category
    }
    func firstConfig(){
        writeQuestion(number: number)
        Utilities.startButton(nextButton)
        errorLabel.alpha = 0
        progressBar.setProgress(1.0/Float(numberOfQuestions), animated: false)
        numberOfQueLabel.text = "Question \(number)/\(numberOfQuestions)"
    }
    @IBAction func answersButton(_ sender: UIButton) {
        answered = true
        if (sender.tag == 1){
            score += diffuculity
            scoreLabel.text = String(score)
            Utilities.correctClicked(firstButton)
        } else {
            Utilities.correctClicked(firstButton)
            switch sender.tag {
            case 2 : Utilities.wrongClicked(secondButton)
            case 3 : Utilities.wrongClicked(thirdButton)
            case 4 : Utilities.wrongClicked(fourthButton)
            default:
                print("hello")
            }
        }
    }
    @IBAction func nextButton(_ sender: Any) {
      
        if answered {
            if number == numberOfQuestions {
                      performSegue(withIdentifier: "goToScore", sender: nil)
                  }
            errorLabel.alpha = 0
            answered = false
            number += 1
            numberOfQueLabel.text = "Question \(number)/\(numberOfQuestions)"
            progressBar.progress += 1.0/Float(numberOfQuestions)
            writeQuestion(number: number)
            if number == numberOfQuestions {
                nextButton.setTitle("Finish", for: .normal)
            }
        } else {
            errorLabel.alpha = 1
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
