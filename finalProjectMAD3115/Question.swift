//
//  Question.swift
//  finalProjectMAD3115
//
//  Created by Parwat Kunwar on 2022-06-22.
//

import Foundation

struct Question {
    let question: String;
    let answer: String;
    let optionA: String;
    let optionB: String;
    let optionC: String;
    let optionD: String;
    var userAnswer: String?
    
    init(q: String, a: String, b: String, c: String, d:String, ans: String) {
        question = q;
        optionA = a;
        optionB = b;
        optionC = c;
        optionD = d;
        answer = ans;
    }
    
    mutating func setAnswer(option: String) {
        self.userAnswer = option;
    }
}
