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
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var numberOfQueLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var category : Category?
    var diffuculity = 20
    var numberOfQuestions = 10
    var number = 1
    var score = 0
    var answered = false
    var correctA = 1
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? ScoreViewController
        destination?.score = Score(subject: (category?.categoryName)!, score: score)
    }
    
    func filter(name: String) -> String {
        let firstFilter = name.replacingOccurrences(of: "&quot;", with: "", options: .regularExpression, range: nil)
        let secondFilter = firstFilter.replacingOccurrences(of: "&lsquo", with: "", options: .regularExpression, range: nil)
        let thirdFilter = secondFilter.replacingOccurrences(of: "&#039;", with: "", options: .regularExpression, range: nil)
        let fourthFilter = thirdFilter.replacingOccurrences(of: "&ldquo;", with: "", options: .regularExpression, range: nil)
        let fifthFilter = fourthFilter.replacingOccurrences(of: "&rdquo;", with: "", options: .regularExpression, range: nil)
        let sixthFilter = fifthFilter.replacingOccurrences(of: "&eacute;", with: "", options: .regularExpression, range: nil)
        let seventhFilter = sixthFilter.replacingOccurrences(of: "&rsquo;", with: "", options: .regularExpression, range: nil)
        let eighthFilter = seventhFilter.replacingOccurrences(of: "&sbquo;", with: "", options: .regularExpression, range: nil)
        let ninthFilter = eighthFilter.replacingOccurrences(of: "&bdquo;", with: "", options: .regularExpression, range: nil)
        
        return ninthFilter
    }
    
    func writeQuestion(number : Int) {
        correctA = Int.random(in: 1...4)
        let ref = Database.database().reference()
        ref.child("User01").child("\(number-1)").observeSingleEvent(of: .value)
            { (snapshot) in
            let value = snapshot.value as? NSDictionary
            let question = value?["question"] as? String ?? ""
                 
                self.questionLabel.text = self.filter(name: question)
                
                let correctAnswer = value?["correct_answer"] as? String ?? ""
                let inCorrectAnswer0 = value?["incorrect_answers0"] as? String ?? ""
                let inCorrectAnswer1 = value?["incorrect_answers1"] as? String ?? ""
                let inCorrectAnswer2 = value?["incorrect_answers2"] as? String ?? ""
                switch self.correctA {
                case 1: self.firstButton.setTitle(self.filter(name: correctAnswer), for: .normal)
                        self.secondButton.setTitle(self.filter(name: inCorrectAnswer0), for: .normal)
                        self.thirdButton.setTitle(self.filter(name: inCorrectAnswer1), for: .normal)
                        self.fourthButton.setTitle(self.filter(name: inCorrectAnswer2), for: .normal)
                    
                case 2: self.secondButton.setTitle(self.filter(name: correctAnswer), for: .normal)
                        self.firstButton.setTitle(self.filter(name: inCorrectAnswer0), for: .normal)
                        self.thirdButton.setTitle(self.filter(name: inCorrectAnswer1), for: .normal)
                        self.fourthButton.setTitle(self.filter(name: inCorrectAnswer2), for: .normal)
                    
                case 3: self.thirdButton.setTitle(self.filter(name: correctAnswer), for: .normal)
                        self.fourthButton.setTitle(self.filter(name: inCorrectAnswer0), for: .normal)
                        self.firstButton.setTitle(self.filter(name: inCorrectAnswer1), for: .normal)
                        self.secondButton.setTitle(self.filter(name: inCorrectAnswer2), for: .normal)
                    
                case 4: self.fourthButton.setTitle(self.filter(name: correctAnswer), for: .normal)
                        self.firstButton.setTitle(self.filter(name: inCorrectAnswer0), for: .normal)
                        self.secondButton.setTitle(self.filter(name: inCorrectAnswer1), for: .normal)
                        self.thirdButton.setTitle(self.filter(name: inCorrectAnswer2), for: .normal)
                default:
                    print("write Correct answer")
                }
            }
        Utilities.startFilledButton(firstButton)
        Utilities.startFilledButton(secondButton)
        Utilities.startFilledButton(thirdButton)
        Utilities.startFilledButton(fourthButton)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        firstConfig()
        title = category?.categoryName
    }
    func firstConfig(){
        writeQuestion(number: number)
        Utilities.startButton(nextButton)
        errorLabel.alpha = 0
        progressBar.setProgress(1.0/Float(numberOfQuestions), animated: false)
        numberOfQueLabel.text = "Question \(number)/\(numberOfQuestions)"
    }
    
    func disableAllButtons() {
        firstButton.isEnabled = false
        secondButton.isEnabled = false
        thirdButton.isEnabled = false
        fourthButton.isEnabled = false
    }
    
    func enableAllButtons() {
        firstButton.isEnabled = true
        secondButton.isEnabled = true
        thirdButton.isEnabled = true
        fourthButton.isEnabled = true
    }
    
    func clickCorrect(number: Int) {
        switch number {
        case 1 : Utilities.correctClicked(firstButton)
        case 2 : Utilities.correctClicked(secondButton)
        case 3 : Utilities.correctClicked(thirdButton)
        case 4 : Utilities.correctClicked(fourthButton)
        default:
            print("hello")
        }
        disableAllButtons()
    }
    @IBAction func answersButton(_ sender: UIButton) {
        answered = true
        if (sender.tag == correctA){
            score += diffuculity
            scoreLabel.text = String(score)
            clickCorrect(number: correctA)
        } else {
            switch sender.tag {
            case 1 : Utilities.wrongClicked(firstButton)
                clickCorrect(number: correctA)
            case 2 : Utilities.wrongClicked(secondButton)
                clickCorrect(number: correctA)
            case 3 : Utilities.wrongClicked(thirdButton)
                clickCorrect(number: correctA)
            case 4 : Utilities.wrongClicked(fourthButton)
                clickCorrect(number: correctA)
            default:
                print("hello")
            }
        }
    }
    @IBAction func nextButton(_ sender: Any) {
      
        if answered {
            if number == numberOfQuestions {
                      performSegue(withIdentifier: "goToScore", sender: nil) // Going to score
                  }
            enableAllButtons()
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
}
