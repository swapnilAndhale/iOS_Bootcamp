//
//  ViewController.swift
//  Xylophone
//
//  Created by Swapnil Andhale on 28/09/2021.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        
        playSound(soundName: sender.currentTitle!)
        
        //Reduce the opecity by half after button press
        sender.alpha = 0.5
        
        // code should execute after 0.2 second delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            // bring sender opacity to full
            sender.alpha = 1.0
        }
        
    }
    
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
    }
}


