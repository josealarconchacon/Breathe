//
//  SmallView.swift
//  Breathe
//
//  Created by Jose Alarcon Chacon on 11/24/20.
//

import UIKit

class SmallView: UIViewController {

    @IBOutlet weak var minutesLable: UILabel!
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBOutlet weak var startButtonOutlet: UIButton!
    
    var minutes = 5
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func setTime(_ sender: UISlider) {
        minutes = Int(sender.value)
        minutesLable.text = String(minutes)
    }
    
    @IBAction func startButton(_ sender: UIButton) {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(starBreathing), userInfo: nil, repeats: true)
    }
    
    @objc func starBreathing() {
        minutes -= 1
        minutesLable.text = String(minutes)
        
        if(minutes == 0) {
            timer.invalidate()
        }
    }
}
