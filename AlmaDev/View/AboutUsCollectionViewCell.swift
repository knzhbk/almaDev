//
//  AboutUsCollectionViewCell.swift
//  AlmaDev
//
//  Created by Adina Kenzhebekova on 5/28/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class AboutUsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var personLabel: UILabel!
    
    override func awakeFromNib() {
           super.awakeFromNib()
        personImageView.layer.borderWidth = 1
        personImageView.layer.masksToBounds = false
        personImageView.layer.borderColor = #colorLiteral(red: 0.5942665339, green: 0.5330229402, blue: 0.6821249723, alpha: 1)
        personImageView.layer.cornerRadius = personImageView.frame.height/2.5
        personImageView.clipsToBounds = true
       }
}
