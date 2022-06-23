//
//  QuizViewController.swift
//  finalProjectMAD3115
//
//  Created by Parwat Kunwar on 2022-06-22.
//

import Foundation
import UIKit

class QuizViewController: UIViewController {
    var points = 0;
    var isAnswerSelected = false;
    var currentQuestionIndex = 0;
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var questionNo: UILabel!
    @IBOutlet weak var totalQuestions: UILabel!
    
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet var progressBar: UIProgressView!
    
    @IBAction func optionA(_ sender: UIButton) {
        
    }
    @IBAction func optionB(_ sender: UIButton) {
        
    }
    @IBAction func optionC(_ sender: UIButton) {
        
    }
    @IBAction func optionD(_ sender: UIButton) {
        
    }
    
    @IBAction func next(_ sender: UIButton) {
        
    }
    
    @IBAction func prev(_ sender: UIButton) {
        
    }
    
    var selectedQuestions: [Question] = []
    var currentQuestion: Question?
    
    var questions = [Question(q: "Which of the following is not a web browser?", a: "MOSAIC", b: "WWW", c: "Facebook", d: "Netscape navigator", ans: "c"), Question(q: "In computer world, Trojan refer to:", a: "Virus", b: "Malware", c: "Worm", d: "Spyware", ans: "b"), Question(q: "Which protocol is used to receive e-mails", a: "SMTP", b: "POP3", c: "HTTP", d: "FTP", ans: "b"),  Question(q: "Which protocol is used to send e-mails?", a: "SMTP", b: "POP3", c: "HTTP", d: "FTP", ans: "a"),  Question(q: "Which type of number system to calculate and to store data?", a: "Decimal", b: "Octal", c: "Binary", d: "HexaDecimal", ans: "c"), Question(q: "How many bits are in 1 byte?", a: "4", b: "8", c: "16", d: "1", ans: "b")]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setInitialQuestion()
        setValuesForLabels()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func setValuesForLabels() {
        question.text = "\(currentQuestionIndex + 1). \(currentQuestion!.question)"
        optionA.setTitle(currentQuestion?.optionA, for: .normal)
        optionB.setTitle(currentQuestion?.optionB, for: .normal)
        optionC.setTitle(currentQuestion?.optionC, for: .normal)
        optionD.setTitle(currentQuestion?.optionD, for: .normal)
        questionNo.text = String(currentQuestionIndex + 1)
        totalQuestions.text = String(selectedQuestions.count)
    }
    
    func setInitialQuestion() {
        selectedQuestions = getRandom3Questions()
        currentQuestion = self.selectedQuestions[0]
        currentQuestionIndex = 0;
        prevButton.isEnabled = false
//        progressBar.progress = 
    }

    func getRandom3Questions() -> [Question] {
        let shuffledArr = questions.shuffled();
        
        return Array(shuffledArr.prefix(3));
    }
    
    @IBAction func setAnswer(_ sender: UIButton) {
        
    }
    
    @IBAction func prevQuestion(_ sender: UIButton) {
        
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        
        // index starts from 0 till 2. (0, 1, 2)
        if (currentQuestionIndex + 1 == 3) {
            
        }
        
        currentQuestionIndex += 1
        currentQuestion = self.selectedQuestions[currentQuestionIndex]
        
        setValuesForLabels()
        
    }
    
    func getResults() {
        
    }
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
