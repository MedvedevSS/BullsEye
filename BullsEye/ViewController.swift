//
//  ViewController.swift
//  BullsEye
//
//  Created by Sergey Medvedev on 14.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var targetLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        starNewRound()
    }
    
    func starNewRound() {
        
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        
        updateLabels()
    }
    
    func updateLabels() {
        
        targetLabel.text = "\(targetValue)"
        scoreLabel.text = "\(score)"
        roundLabel.text = "\(round)"
    }
    
    @IBAction func showAlert() {
        
        let difference = abs(currentValue - targetValue)
        let points = 100 - difference
        
        score += points
        
        let message = "You scored \(points) points"
        
//        let message = " The target value is: \(targetValue)" + "\n The value of the slider is: \(currentValue)" + "\n The difference is: \(difference)"
        
        let alert = UIAlertController(title: "Hello World",
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK",
                                   style: .default,
                                   handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        starNewRound()
    }

    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    
}

