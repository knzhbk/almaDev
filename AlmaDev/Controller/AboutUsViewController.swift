//
//  AboutUsViewController.swift
//  AlmaDev
//
//  Created by Adina Kenzhebekova on 5/28/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let reuseIdentifier = "AboutUsCell"
    let images = [
        Person(imageName: "male.png",
               imageTitle: "Baglan",
               personFullName: "Baglan Surname",
               personInfo: "Baglan Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation",
               telegramLink: "https://t.me/SByTe1024",
               cvLink: "https://hh.kz",
               phoneNumber: "+777777777"),
        Person(imageName: "female.png",
               imageTitle: "Ainur",
               personFullName: "Ainur Surname",
               personInfo: "Ainur Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation",
               telegramLink: "https://t.me/knzhbks",
               cvLink: "https://hh.kz",
               phoneNumber: "+777777777"),
        Person(imageName: "male.png",
               imageTitle: "Rodion",
               personFullName: "Rodion Surname",
               personInfo: "Rodion Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation",
               telegramLink: "https://t.me/knzhbks",
               cvLink: "https://hh.kz",
               phoneNumber: "+777777777"),
        Person(imageName: "female.png",
               imageTitle: "Marzhan",
               personFullName: "Marzhan Surname",
               personInfo: "Marzhan Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation",
               telegramLink: "https://t.me/knzhbks",
               cvLink: "https://hh.kz",
               phoneNumber: "+777777777"),
        Person(imageName: "female.png",
               imageTitle: "Adina",
               personFullName: "Adina Surname",
               personInfo: "Adina Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation",
               telegramLink: "https://t.me/knzhbks",
               cvLink: "https://hh.kz",
               phoneNumber: "+777777777")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! AboutUsCollectionViewCell
        let person = images[indexPath.item]
        cell.personLabel.text = person.imageTitle
        cell.personImageView.image = UIImage(named: person.imageName)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AboutUsDetailViewController,
            let cell = sender as? AboutUsCollectionViewCell,
            let indexPath = collectionView.indexPath(for: cell) {
            let person = images[indexPath.row]
            destination.person = person
        }
    }
}
