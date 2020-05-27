//
//  CategoryViewController.swift
//  AlmaDev
//
//  Created by Apple on 5/27/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var categoriesArray = ["animals", "art", "computers", "geography", "sport", "music", "films", "nature", "cartoons", "books"]
    
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoriesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellCategory", for: indexPath) as! CategoryCollectionViewCell
        
        let cellIndex = indexPath.item
        cell.categoryName.text = categoriesArray[cellIndex]
        cell.categoryImage.image = UIImage(named:categoriesArray[cellIndex])
        
        return cell
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    

    @IBOutlet weak var CategoryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CategoryCollectionView.delegate = self
        CategoryCollectionView.dataSource = self

        
    }
    
    
    
    



}
