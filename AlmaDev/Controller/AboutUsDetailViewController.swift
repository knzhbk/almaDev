//
//  AboutUsDetailViewController.swift
//  AlmaDev
//
//  Created by Adina Kenzhebekova on 5/29/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class AboutUsDetailViewController: UIViewController {
    
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var personInfoTextView: UITextView!
    @IBOutlet weak var telegramTextView: UITextView!
    @IBOutlet weak var resumeTextView: UITextView!
    
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(person!)
        if let person = person {
            personImageView.image = UIImage(named: person.imageName)
            personNameLabel.text = person.personFullName
            personInfoTextView.text = person.personInfo
            
            let telegramAttributedString = NSMutableAttributedString(string: "Telegram")
            telegramAttributedString.addAttribute(.link, value: person.telegramLink, range: NSRange(location: 0, length: 8))
            telegramTextView.attributedText = telegramAttributedString
            telegramTextView.font = .systemFont(ofSize: 22)
            
            let resumeAttributedString = NSMutableAttributedString(string: "Resume")
            resumeAttributedString.addAttribute(.link, value: person.cvLink, range: NSRange(location: 0, length: 6))
            resumeTextView.attributedText = resumeAttributedString
            resumeTextView.font = .systemFont(ofSize: 22)
            
            roundUpImageView()
        }
    }
    
    func roundUpImageView() {
        personImageView.layer.borderWidth = 1
        personImageView.layer.masksToBounds = false
        personImageView.layer.borderColor = #colorLiteral(red: 0.5942665339, green: 0.5330229402, blue: 0.6821249723, alpha: 1)
        personImageView.layer.cornerRadius = personImageView.frame.height/2.5
        personImageView.clipsToBounds = true
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL)
        return false
    }
}
