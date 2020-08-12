//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Kaushal 12/07/2020.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    var timer = Timer()
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }


    //When True/False is pressed change the question
    @IBAction func answerButtonPressed(_ sender: UIButton)
    {
        
        let userAnswer = sender.currentTitle! // True, False
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight
        {
            sender.backgroundColor = UIColor.green
        }
        
        else
        {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    // Update UI with next question from Array
    @objc func updateUI()
    {
        questionLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"

    }
    
}

