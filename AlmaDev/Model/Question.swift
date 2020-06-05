//
//  Question.swift
//  AlmaDev
//
//  Created by Arman Tursynbek on 5/30/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
struct Question: Decodable {
var response_code : Int
var results : [Results]
}
struct Results: Decodable {
    var category : String
    var type : String
    var difficulty : String
    var question : String
    var correct_answer : String
    var incorrect_answers: [String]

}
