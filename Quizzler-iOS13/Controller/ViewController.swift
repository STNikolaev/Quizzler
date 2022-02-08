//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var Button1Label: UIButton!
    @IBOutlet weak var Button2Label: UIButton!
    @IBOutlet weak var Button3Label: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func answerButtonDidPress(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let currentAnswer = quizBrain.checkAnswer(userAnswer)
        
        if currentAnswer {
            sender.backgroundColor = .green
            sender.layer.cornerRadius = sender.frame.height / 4
        } else {
            sender.backgroundColor = .red
            sender.layer.cornerRadius = sender.frame.height / 4
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        let buttonAnswer = quizBrain.getAnswers()
        Button1Label.setTitle(buttonAnswer[0], for: .normal)
        Button2Label.setTitle(buttonAnswer[1], for: .normal)
        Button3Label.setTitle(buttonAnswer[2], for: .normal)
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Your score is \(quizBrain.getScore())"
        
        
        Button1Label.backgroundColor = .clear
        Button2Label.backgroundColor = .clear
        Button3Label.backgroundColor = .clear
        
    }
    
    

}

