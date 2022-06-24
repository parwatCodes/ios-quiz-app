//
//  ResultViewContainer.swift
//  finalProjectMAD3115
//
//  Created by Parwat Kunwar on 2022-06-22.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    var totalPoints: Int?
    var totalQuestions: Int?
    
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var restartQuiz: UIButton!
    @IBOutlet weak var scoreInPercentage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        message.text = getMessage()
        scoreInPercentage.text = String(format: "%.2f", getScoreInPercentage())
    }
    
    @IBAction func restartQuiz(_ sender: UIButton) {
        
    }
    
    func getScoreInPercentage() -> Float {
        return Float(totalPoints! / totalQuestions!) * 100
    }
    
    func getMessage() -> String {
        switch totalPoints {
            case 0:
                return "\(totalPoints!)/\(totalQuestions!) \n Please try again!"
            case 1:
                return "\(totalPoints!)/\(totalQuestions!) \n Good job!"
            case 2:
                return "\(totalPoints!)/\(totalQuestions!) \n Very Good!"
            case 3:
                return "\(totalPoints!)/\(totalQuestions!) \n Excellent work!"
            default:
                return "\(totalPoints!)/\(totalQuestions!) \n Welcome to quiz app."
        }
    }
}

