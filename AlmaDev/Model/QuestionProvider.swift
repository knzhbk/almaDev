//
//  QuestionProvider.swift
//  AlmaDev
//
//  Created by Arman Tursynbek on 5/30/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import Firebase
class QuestionProvider {
    var question : Question?
    func getQuestion(questionAddress: String){
           if let url = URL(string: questionAddress) {
               let questionLoadTask = URLSession.shared.dataTask(with: url) {
                   (data, response, error)
                   in
                   if let data = data {
                       do {
                           self.question = try JSONDecoder().decode(Question.self,from: data)
                        NotificationCenter.default.post(name: NOTIFICATION_QUESTION_SEND, object: self.question )
                     //       print("Has send")
                      //  let ref = Database.database().reference()
                       // for value in self.question!.results {
                      //  ref.childByAutoId().setValue(value)
                       // }
                       } catch {
                           print("Decoding JSON failure")
                            print(error)
                        
                    }
                }
            }
        questionLoadTask.resume()
        }

    }
}
