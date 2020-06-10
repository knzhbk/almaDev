//
//  Category.swift
//  AlmaDev
//
//  Created by Apple on 5/29/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation

struct Category
{
    var categoryName: String?
    var categoryNum: String?
    
    init(categoryName: String, categoryNum: String) {
        
        self.categoryName = categoryName
        self.categoryNum = categoryNum
    }
}
