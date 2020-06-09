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
    var cat: String = ""
    var questionProvder: QuestionProvider?
    var categoriesArray = ["27": "Animals", "25":"Art" , "18":"Computers", "22":"Geography", "21": "Sport", "12":"Music", "11":"Films", "17":"Nature", "32":"Cartoons", "10":"Books"]
    @IBOutlet weak var categoryLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.alpha = 0
        Utilities.startButton(startButton)
        NotificationCenter.default.addObserver(self, selector: #selector(showButton), name: NOTIFICATION_QUESTION_SEND, object: nil)
        if let category = category{
            cat = categoriesArray[category.categoryName!]!
            categoryLabel.text = cat
        questionProvder = QuestionProvider()
           let i = category.categoryName!
             let questionAddress = "https://opentdb.com/api.php?amount=5&category=\(i)&difficulty=medium&type=multiple"
             questionProvder?.getQuestion(questionAddress: questionAddress)
        }
    }
    @objc func showButton(){
        loadingLabel.alpha = 0
        loadingBar.alpha = 0
        startButton.alpha = 1
         }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? TestViewController
        destination!.category = Category(category: cat)
    }
}
