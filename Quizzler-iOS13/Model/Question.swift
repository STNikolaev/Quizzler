//
//  Questions.swift
//  Quizzler-iOS13
//
//  Created by Alexandr Nikolaev on 8.02.22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {

    let question: String
    let answers: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String){
        question = q
        answers = a
        self.correctAnswer = correctAnswer
    }
    }



