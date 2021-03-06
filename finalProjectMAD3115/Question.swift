//
//  Question.swift
//  finalProjectMAD3115
//
//  Created by Parwat Kunwar on 2022-06-22.
//

import Foundation

struct Question: Encodable {
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
    
    func getQuestionOptions() -> [String: String] {
        let props = ["optionA": optionA,"optionB": optionA,"optionC": optionC,"optionD": optionD]
        
        return props
    }
    
    func getQuestionAns() -> [String: String?] {
        return [
            "answer": answer,
            "userAnswer": userAnswer
        ]
    }
}

//extension Encodable {
//    var dictionary: [String: String]? {
//        guard let data = try? JSONEncoder().encode(self) else { return nil }
//        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: String] }
//    }
//}
