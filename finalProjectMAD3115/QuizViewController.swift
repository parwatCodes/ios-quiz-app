//
//  QuizViewController.swift
//  finalProjectMAD3115
//
//  Created by Parwat Kunwar on 2022-06-22.
//

import Foundation
import UIKit

class QuizViewController: UIViewController {
    var currentQuestionIndex = 0;

    var resultViewCtrl: ResultViewController!
    var selectedQuestions: [Question] = [] // Loads 3 questions randomly
    var currentQuestion: Question?
    
    var questions = getQuestions() // Loads all questions.

    override func viewDidLoad() {
        super.viewDidLoad()

        setInitialQuestion()
        setInitialConfigs()
        setValuesForLabels()
    }
    
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
        changeSelectedOptionColor(optionA)
        
    }
    @IBAction func optionB(_ sender: UIButton) {
        changeSelectedOptionColor(optionB)
    }
    @IBAction func optionC(_ sender: UIButton) {
        changeSelectedOptionColor(optionC)
    }
    @IBAction func optionD(_ sender: UIButton) {
        changeSelectedOptionColor(optionD)
    }
    @IBAction func next(_ sender: UIButton) {
        
    }
    @IBAction func prev(_ sender: UIButton) {
        
    }
    
    @IBAction func setAnswer(_ sender: UIButton) {
        
    }
    
    @IBAction func prevQuestion(_ sender: UIButton) {
        
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        if (currentQuestionIndex + 1 == 3) {
            resultViewCtrl = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController

            resultViewCtrl.modalPresentationStyle = .fullScreen
            return self.present(resultViewCtrl, animated: true, completion: nil)
        }
        
        currentQuestionIndex += 1
        currentQuestion = self.selectedQuestions[currentQuestionIndex]
        
        setValuesForLabels()
        
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
        selectedQuestions = getRandom3Questions(questions)
        currentQuestion = self.selectedQuestions[0]
    }
    
    func setInitialConfigs() {
        currentQuestionIndex = 0;
        prevButton.isEnabled = false
        nextButton.isEnabled = false
    }
    
    func isAnswerSelectedForCurrentQuestion() -> Bool {
        let isAnsSelected = selectedQuestions[currentQuestionIndex].userAnswer
        
        return isAnsSelected != nil ? true : false
    }
    
    func changePrevButtonFlag(flag: Bool) {
        prevButton.isEnabled = flag
    }
    
    func changeNextButtonFlag(flag: Bool) {
        nextButton.isEnabled = flag
    }
    
    func setSelectedColor(selectedOption: UIButton) {
        selectedOption.backgroundColor = .green
        selectedOption.tintColor = .black
    }
    
    func unsetColor(_ option: UIButton) {
        option.backgroundColor = nil
        option.tintColor = nil
    }
    
    func changeSelectedOptionColor(_ selectedOption: UIButton) {
        switch selectedOption {
            case optionA:
                setSelectedColor(selectedOption: optionA)
                unsetColor(optionB)
                unsetColor(optionC)
                unsetColor(optionD)
            case optionB:
                setSelectedColor(selectedOption: optionB)
                unsetColor(optionA)
                unsetColor(optionC)
                unsetColor(optionD)
            case optionC:
                setSelectedColor(selectedOption: optionC)
                unsetColor(optionA)
                unsetColor(optionB)
                unsetColor(optionD)
            case optionD:
                setSelectedColor(selectedOption: optionD)
                unsetColor(optionB)
                unsetColor(optionC)
                unsetColor(optionA)
            default:
                break
        }
    }
}

