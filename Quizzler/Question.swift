//
//  Question.swift
//  Quizzler
//
//  Created by phoebe MBP13 on 2/22/18.
//  Copyright © 2018 25x52. All rights reserved.
//

import Foundation


class Question {
    let questionText : String
    let answer : Bool
    
    init(text : String, correctAnswer : Bool) {
        questionText = text
        answer = correctAnswer
    }
}

