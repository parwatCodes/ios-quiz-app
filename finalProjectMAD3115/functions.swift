//
//  functions.swift
//  finalProjectMAD3115
//
//  Created by Parwat Kunwar on 2022-06-23.
//

import Foundation

func getRandom3Questions(_ questions: [Question]) -> [Question] {
    let shuffledArr = questions.shuffled();
    
    return Array(shuffledArr.prefix(3));
}

extension Array {
    /// Picks `n` random elements (partial Fisher-Yates shuffle approach)
    subscript (randomPick n: Int) -> [Element] {
        var copy = self
        for i in stride(from: count - 1, to: count - n - 1, by: -1) {
            copy.swapAt(i, Int(arc4random_uniform(UInt32(i + 1))))
        }
        return Array(copy.suffix(n))
    }
}

func getQuestions() -> [Question] {
    return [Question(q: "Which of the following is not a web browser?", a: "MOSAIC", b: "WWW", c: "Facebook", d: "Netscape navigator", ans: "c"), Question(q: "In computer world, Trojan refer to:", a: "Virus", b: "Malware", c: "Worm", d: "Spyware", ans: "b"), Question(q: "Which protocol is used to receive e-mails", a: "SMTP", b: "POP3", c: "HTTP", d: "FTP", ans: "b"),  Question(q: "Which protocol is used to send e-mails?", a: "SMTP", b: "POP3", c: "HTTP", d: "FTP", ans: "a"),  Question(q: "Which type of number system to calculate and to store data?", a: "Decimal", b: "Octal", c: "Binary", d: "HexaDecimal", ans: "c"), Question(q: "How many bits are in 1 byte?", a: "4", b: "8", c: "16", d: "1", ans: "b")]
}
