//
//  QuizViewController.swift
//  finalProjectMAD3115
//
//  Created by Parwat Kunwar on 2022-06-22.
//

import Foundation
import UIKit

class QuizViewController: UIViewController {
    var currentQuestionIndex = 0 {
        didSet {
            currentQuestion = self.selectedQuestions[currentQuestionIndex]
            
            setValuesForLabels()
            
            unsetColor(optionA)
            unsetColor(optionB)
            unsetColor(optionC)
            unsetColor(optionD)
            
            setSelectedAns()
            
            if (currentQuestionIndex == 0) {
                prevButton.isEnabled = false;
            }
            
            if currentQuestionIndex != 0 {
                prevButton.isEnabled = true;
            }
            
        }
    }
    
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
        setAnswer(currentQuestion!.optionA)
    }
    @IBAction func optionB(_ sender: UIButton) {
        changeSelectedOptionColor(optionB)
        setAnswer(currentQuestion!.optionB)
    }
    @IBAction func optionC(_ sender: UIButton) {
        changeSelectedOptionColor(optionC)
        setAnswer(currentQuestion!.optionC)
    }
    @IBAction func optionD(_ sender: UIButton) {
        changeSelectedOptionColor(optionD)
        setAnswer(currentQuestion!.optionD)
    }
    
    func setAnswer(_ userAns: String) {
        selectedQuestions[currentQuestionIndex].userAnswer = userAns
    }
    
    @IBAction func prevQuestion(_ sender: UIButton) {
        currentQuestionIndex -= 1
    }
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        if (currentQuestionIndex + 1 == 3) {
            resultViewCtrl = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController

            resultViewCtrl.modalPresentationStyle = .fullScreen
            resultViewCtrl.selectedQuestions = selectedQuestions
            resultViewCtrl.totalQuestions = selectedQuestions.count
            return self.present(resultViewCtrl, animated: true, completion: nil)
        }
        
        currentQuestionIndex += 1
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
    
    func setSelectedAns() {
        let options = currentQuestion!.getQuestionOptions();
        
        for (key, value) in options {
            if value == currentQuestion?.userAnswer {
                let button = getButtonFromText(text: key);
                setSelectedColor(selectedOption: button)
            }
        }
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
    
    func setSelectedColor(selectedOption: UIButton) {
        selectedOption.backgroundColor = .green
        selectedOption.tintColor = .black
    }
    
    func unsetColor(_ option: UIButton) {
        option.backgroundColor = nil
        option.tintColor = nil
    }
    
    func getButtonFromText(text: String) -> UIButton {
        switch text {
        case "optionA":
            return optionA
        case "optionB":
            return optionB
        case "optionC":
            return optionC
        case "optionD":
            return optionD
        default:
            return optionD
        }
    }
    
    func changeSelectedOptionColor(_ selectedOption: UIButton) {
        nextButton.isEnabled = true;
        
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

