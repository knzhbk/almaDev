//
//  LevelViewController.swift
//  AlmaDev
//
//  Created by Apple on 5/29/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class LevelViewController: UIViewController {

    
    @IBOutlet var levelLabel: UILabel!
    @IBOutlet weak var loadingBar: UIActivityIndicatorView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var loadingLabel: UILabel!
    
    var level = "Easy"
    var category: Category?
    var questionAddress = ""
    var cat: String = ""
    var questionProvider: QuestionProvider?
    
    var levelChanged = false


    @IBOutlet weak var categoryLabel: UILabel!    
    override func viewDidLoad() {
        super.viewDidLoad()
        levelLabel.text = level
        startButton.alpha = 0
        Utilities.startButton(startButton)
        
    
        NotificationCenter.default.addObserver(self, selector: #selector(settingLevel), name: NOTIFICATION_SETTING_LEVEL, object: nil)
        
        
        if levelChanged == false
        {
            loadQuestions()
        }

        }
    
    func loadQuestions()
    {
        if let category = category {
            categoryLabel.text = category.categoryName

                 NotificationCenter.default.addObserver(self, selector: #selector(showButton), name: NOTIFICATION_QUESTION_SEND, object: nil)
        
            questionProvider = QuestionProvider()
        questionAddress = "https://opentdb.com/api.php?amount=5&category=\(category.categoryNum!)&difficulty=\(level.lowercased())&type=multiple"
                       questionProvider?.getQuestion(questionAddress: questionAddress)
            
        }
    }
    @objc func settingLevel(notification: Notification){
        if let setLevel = notification.object as?  String
        {
            levelChanged = true
            
            level = setLevel
            levelLabel.text = level
            loadQuestions()
            
            
            
        }
    }
    @objc func showButton(){
        loadingLabel.alpha = 0
        loadingBar.alpha = 0
        startButton.alpha = 1
         }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? TestViewController
        destination!.category = category
        print("LEVEL \(levelChanged)")
        print("INFO: \(questionAddress)")
    }
}

