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
    
    var levelUserDefaults = UserDefaults.standard.string(forKey: "Level")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSelectLevelButtonTitle()
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
    
    func presentLevels() {
        UIView.animate(withDuration: 0.5, animations: {
            self.easyLevelButton.isHidden = !(self.easyLevelButton.isHidden)
            self.mediumLevelButton.isHidden = !(self.mediumLevelButton.isHidden)
            self.hardLevelButton.isHidden = !(self.hardLevelButton.isHidden)
            self.view.layoutIfNeeded()
        })
    }
    
    enum Levels: String {
        case easy = "Easy"
        case medium = "Medium"
        case hard = "Hard"
    }
    
    @IBAction func levelTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let level = Levels(rawValue: title) else {
            return
        }
        
        levelUserDefaults = level.rawValue
        UserDefaults.standard.set(levelUserDefaults, forKey: "Level")
        selectLevelButton.setTitle(levelUserDefaults, for: .normal)
        presentLevels()
    }
}
