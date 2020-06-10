//
//  SettingsViewController.swift
//  AlmaDev
//
//  Created by Adina Kenzhebekova on 5/27/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {

    @IBOutlet weak var easyLevelButton: UIButton!
    @IBOutlet weak var mediumLevelButton: UIButton!
    @IBOutlet weak var hardLevelButton: UIButton!
    @IBOutlet weak var selectLevelButton: UIButton!
    
    @IBOutlet weak var selectLanguageButton: UIButton!
    @IBOutlet weak var englishLanguageButton: UIButton!
    @IBOutlet weak var russianLangugageButton: UIButton!
    
    var languageUserDefaults = UserDefaults.standard.string(forKey: "Language")
    var levelUserDefaults = UserDefaults.standard.string(forKey: "Level")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setSelectLanguageButtonTitle()
        setSelectLevelButtonTitle()
        
        NotificationCenter.default.post(name: NOTIFICATION_SETTING_LEVEL, object: self.levelUserDefaults)
        
        
       
    }
    
    func setSelectLanguageButtonTitle() {
        languageUserDefaults = UserDefaults.standard.string(forKey: "Language")
        if languageUserDefaults != nil {
            let language = Languages(rawValue: languageUserDefaults!)
            selectLanguageButton.setTitle(language?.rawValue, for: .normal)
        }
    }
    
    func setSelectLevelButtonTitle() {
        levelUserDefaults = UserDefaults.standard.string(forKey: "Level")
        if levelUserDefaults != nil {
            let level = Levels(rawValue: levelUserDefaults!)
            selectLevelButton.setTitle(level?.rawValue, for: .normal)
           
        }
    }

    @IBAction func selectionHandle(_ sender: UIButton) {
        presentLevels()
    }
    
    @IBAction func languageSelectionHandle(_ sender: UIButton) {
        presentLangugage()
    }
    
    func presentLevels() {
        UIView.animate(withDuration: 0.5, animations: {
            self.easyLevelButton.isHidden = !(self.easyLevelButton.isHidden)
            self.mediumLevelButton.isHidden = !(self.mediumLevelButton.isHidden)
            self.hardLevelButton.isHidden = !(self.hardLevelButton.isHidden)
            self.view.layoutIfNeeded()
        })
    }
    
    func presentLangugage() {
        UIView.animate(withDuration: 0.5, animations: {
            self.englishLanguageButton.isHidden = !(self.englishLanguageButton.isHidden)
            self.russianLangugageButton.isHidden = !(self.russianLangugageButton.isHidden)
            self.view.layoutIfNeeded()
        })
    }
    
    enum Levels: String {
        case easy = "Easy"
        case medium = "Medium"
        case hard = "Hard"
    }
    
    enum Languages: String {
        case english = "English"
        case russian = "Russian"
    }
    
    @IBAction func languageTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let language = Languages(rawValue: title) else {
            return
        }
        
        languageUserDefaults = language.rawValue
        UserDefaults.standard.set(languageUserDefaults, forKey: "Language")
        selectLanguageButton.setTitle(languageUserDefaults, for: .normal)
        presentLangugage()
    }
    
    @IBAction func levelTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle,
            let level = Levels(rawValue: title) else {
            return
        }
        
        
        
        levelUserDefaults = level.rawValue
        
        UserDefaults.standard.set(levelUserDefaults, forKey: "Level")
        selectLevelButton.setTitle(levelUserDefaults, for: .normal)
        presentLevels()
        
        NotificationCenter.default.post(name: NOTIFICATION_SETTING_LEVEL, object: self.levelUserDefaults)
        
        
        
       
        

        
        
        
    }
}


