//
//  CategoryViewController.swift
//  AlmaDev
//
//  Created by Apple on 5/27/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    var categoriesArray = [("animals", "27"), ("art", "25") , ("computers", "18"), ("geography", "22"), ("sport", "21"), ("music", "12"), ("films", "11"), ("nature", "17"), ("cartoons", "32"), ("books", "10")]
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoriesArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellCategory", for: indexPath) as! CategoryCollectionViewCell
        let cellIndex = indexPath.item
        cell.categoryName.text = categoriesArray[cellIndex].0
        cell.categoryImage.image = UIImage(named:categoriesArray[cellIndex].0)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 50, bottom: 10, right: 50)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let categoryCell = categoriesArray[indexPath.item]
        NotificationCenter.default.post(name: NOTIFICATION_CHOSEN_CELL, object: categoryCell )
    }
    @IBOutlet weak var CategoryCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        CategoryCollectionView.delegate = self
        CategoryCollectionView.dataSource = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? LevelViewController,
        let cell = sender as? CategoryCollectionViewCell,
            let indexPath = CategoryCollectionView.indexPath(for: cell)
        {
            let category = categoriesArray[indexPath.item]
            destination.category = Category(categoryName: category.0, categoryNum: category.1)
        }
    }
}
