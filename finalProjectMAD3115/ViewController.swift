//
//  ViewController.swift
//  finalProjectMAD3115
//
//  Created by Parwat Kunwar on 2022-06-22.
//

import UIKit

class ViewController: UIViewController {

    var quizViewCtrl: QuizViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startQuiz(_ sender: UIButton) {
        quizViewCtrl = storyboard?.instantiateViewController(withIdentifier: "QuizViewController") as? QuizViewController
        
        quizViewCtrl.modalPresentationStyle = .fullScreen
        self.present(quizViewCtrl, animated: true, completion: nil)
    }
}

