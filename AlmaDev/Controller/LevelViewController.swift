//
//  LevelViewController.swift
//  AlmaDev
//
//  Created by Apple on 5/29/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class LevelViewController: UIViewController {
    
    @IBOutlet weak var loadingBar: UIActivityIndicatorView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var loadingLabel: UILabel!
    var category: Category?
    var question: Question?
    var questionProvder: QuestionProvider?
    @IBOutlet weak var categoryLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.alpha = 0
        if let category = category{
            categoryLabel.text = category.categoryName
        questionProvder = QuestionProvider()
      //      let i = Int(category.categoryName!)
             let questionAddress = "https://opentdb.com/api.php?amount=5&category=18&difficulty=medium&type=multiple"
             questionProvder?.getQuestion(questionAddress: questionAddress)
        }
            NotificationCenter.default.addObserver(self, selector: #selector(showButton), name: NOTIFICATION_QUESTION_SEND3, object: nil)
            
    }
    @objc func showButton(notification: Notification){
        let getQuestion = notification.object as? Question
        NotificationCenter.default.post(name: NOTIFICATION_QUESTION_SEND2, object: getQuestion )
        loadingLabel.alpha = 0
        loadingBar.alpha = 0
        startButton.alpha = 1
         }
    


}
