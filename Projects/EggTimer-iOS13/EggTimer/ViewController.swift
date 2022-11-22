//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLable: UILabel!
    
    let eggTimer: [String : Int] = ["Soft" : 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var player: AVAudioPlayer!
    var totalTime = 0
    var secondPassed = 0

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimer[hardness]!
        
        progressBar.progress = 0.0
        secondPassed = 0
        titleLable.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        if secondPassed < totalTime {
            
            secondPassed += 1
            progressBar.progress = Float(secondPassed) / Float(totalTime)
            
        } else {
            timer.invalidate()
            titleLable.text = "DONE!"

            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            
        }
    }
    
}
