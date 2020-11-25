//
//  BreatheViewController.swift
//  Breathe
//
//  Created by Jose Alarcon Chacon on 11/24/20.
//

import UIKit
import MBCircularProgressBar

class BreatheViewController: UIViewController {

    @IBOutlet weak var progressView: MBCircularProgressBarView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 20.0) {
            self.progressView.unitString = "inheal"
        }
    }
}
