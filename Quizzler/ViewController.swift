//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    //instantiate the QuestionBank data object containing array of question and answer dict
    var allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var score : Int = 0
    var counter : Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        let firstQuestion = allQuestions.list[counter]
        questionLabel.text = firstQuestion.questionText
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
  
        if sender.tag == 1 {
            pickedAnswer = true
        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        nextQuestion()
        
    }
    
    
    func updateUI() {

        scoreLabel.text = String("Score: \(score)")
        progressLabel.text = "\(counter)/\(allQuestions.list.count)"
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(counter)
        
    }
    

    func nextQuestion() {
        
        if counter < allQuestions.list.count {
            questionLabel.text = allQuestions.list[counter].questionText
        } else {
            print ("end of quiz")
            let alert = UIAlertController(title: "Awesome!", message: "You've reached the end of the quiz. Try again?", preferredStyle: .alert )
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler:{ (UIAlertAction) in self.startOver()
            })
            
            alert.addAction(restartAction)
            
//            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
//                NSLog("The \"OK\" alert occurred.")
//            }))
//            alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Cancel"), style: .cancel, handler: { _ in
//                NSLog("The \"Cancel\" alert occurred.")
//            }))
            self.present(alert, animated: true, completion: nil)
            counter = 0
        }
        
        
    }
    
    
    func checkAnswer() {
        
        if pickedAnswer == allQuestions.list[counter].answer {
            //print ("right answer")
            ProgressHUD.showSuccess("Correct")
            score = score + 1
        } else {
            ProgressHUD.showError("Wrong answer!")
        }
        
        counter += 1
        
        updateUI()
        
    }
    
    
    func startOver() {
       
        counter = 0
        score = 0
        allQuestions.list = allQuestions.list.shuffled()
        nextQuestion()
        updateUI()
        
    }
    


    
}
