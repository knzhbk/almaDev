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
        Person(imageName: "baglan",
               imageTitle: "Baglan",
               personFullName: "Баглан Сарсен",
               personInfo: "Закончил университет имени Сулеймана Демиреля",
               telegramLink: "https://t.me/SByTe1024",
               cvLink: "https://hh.kz"),
        Person(imageName: "ainur",
               imageTitle: "Айнур",
               personFullName: "Айнур Жаппасова",
               personInfo: "Бакалавр: СДУ \nСпециальность: ВТиПО \nВозраст: 24 \nОпыт работы: 2018 - наст Инженер машинного обучения, Вериграм ",
               telegramLink: "https://t.me/ai_citizen",
               cvLink: "http://linkedin.com/in/ai-zhappass"),
        Person(imageName: "rodion",
               imageTitle: "Rodion",
               personFullName: "Родион Другов",
               personInfo: "Специальность: Web-дизайнер \nВозраст: 18 \nОпыт работы: нет",
               telegramLink: "https://t.me/RodionDrugov",
               cvLink: "https://hh.kz"),
        Person(imageName: "marzhan",
               imageTitle: "Маржан",
               personFullName: "Маржан Нурлыкун",
               personInfo: "Бакалавр: Казну, мех-мат Специальность: Информационные системы \nМагистратура: МУИТ, втипо \nВозраст:24 \nОпыт работы: 2017-2019 Нархоз, администратор бд и проектный менеджер 2019-2020 RBC-GROUP , программист-консультант C#",
               telegramLink: "https://t.me/mordzhik",
               cvLink: "https://hh.kz/resume/3ddbdfedff03fe99040039ed1f336352583157"),
        Person(imageName: "adina",
               imageTitle: "Adina",
               personFullName: "Адина Кенжебек",
               personInfo:"Бакалавр: СДУ, Специальность: Вычислительная техника и ПО \nМагистратура: МУИТ, Информационные системы \nВозраст:25 \nОпыт работы: 2017 стажер ios разработчик в 'Колеса Крыша Маркет', \n2018 junior ios разработчик ТОО 'RPS PLUS'",
               telegramLink: "https://t.me/knzhbks",
               cvLink: "https://hh.kz/applicant/resumes/view?resume=f93db840ff02daff9a0039ed1f316b5565336f")
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
