//
//  QuestionProvider.swift
//  AlmaDev
//
//  Created by Arman Tursynbek on 5/30/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
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
                     //       print("Has send")
                        let ref = Database.database().reference()
                       // let userID = Auth.auth().currentUser!.uid
                        var i = 0
                        for value in self.question!.results {
                            ref.child("User01").child("\(i)").setValue(["category": value.category, "question": value.question,"correct_answer": value.correct_answer,"incorrect_answers0": value.incorrect_answers[0],"incorrect_answers1": value.incorrect_answers[1],"incorrect_answers2": value.incorrect_answers[2]])
                            i += 1
                        }
                        NotificationCenter.default.post(name: NOTIFICATION_QUESTION_SEND, object: self.question )

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
