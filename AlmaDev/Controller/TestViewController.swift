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
    var question : Question?
    var category = "Geography"
    var diffuculity = 2
    var numberOfQuestions = 5
    var number = 1
    var score = 0
    var answered = false
    var correctAnswer = "Correct"
    let wrongImage = UIImage(named: "wrong")
    let correctImage = UIImage(named: "correct")
    let roundImage = UIImage(named: "round")
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var numberOfQueLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
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
        title = category
        firstButton.setImage(roundImage, for: .normal)
        firstButton.backgroundColor = .white
        firstButton.tintColor = .lightGray
        secondButton.setImage(roundImage, for: .normal)
        secondButton.backgroundColor = .white
        secondButton.tintColor = .lightGray
        thirdButton.setImage(roundImage, for: .normal)
        thirdButton.backgroundColor = .white
        fourthButton.setImage(roundImage, for: .normal)
        fourthButton.backgroundColor = .white
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        firstConfig()
    
        //NotificationCenter.default.addObserver(self, selector: #selector(showButton), name: NOTIFICATION_QUESTION_SEND2, object: nil)
    }
    /*@objc func showButton(notification: Notification) {
        let getQuestion = notification.object as? Question
        question = getQuestion
           
    }*/
    func firstConfig(){
        writeQuestion(number: number)
        correctImage?.withTintColor(.white, renderingMode: .automatic)
        wrongImage?.withTintColor(.white, renderingMode: .automatic)
        errorLabel.alpha = 0
        scoreLabel.text = String(score)
        progressBar.setProgress(1.0/Float(numberOfQuestions), animated: false)
        numberOfQueLabel.text = "Question \(number)/\(numberOfQuestions)"
    }
    @IBAction func answersButton(_ sender: Any) {
        answered = true
        score += diffuculity
        scoreLabel.text = String(score)
        firstButton.setImage(correctImage, for: .normal)
        secondButton.setImage(correctImage, for: .highlighted)
        firstButton.tintColor  = .green
        firstButton.backgroundColor = .orange
        secondButton.backgroundColor = .red
        secondButton.setImage(wrongImage, for: .normal)
        secondButton.tintColor = .magenta
        
    }
    func Finish(){
        
    }
    @IBAction func nextButton(_ sender: Any) {
        if number == numberOfQuestions {
            Finish()
        }
        if answered {
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
