//
//  SmallView.swift
//  Breathe
//
//  Created by Jose Alarcon Chacon on 11/24/20.
//

import UIKit

class SmallView: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var countdown: UIPickerView!
    @IBOutlet weak var startButton: UIButton!
    
    private var count = Time()

    override func viewDidLoad() {
        super.viewDidLoad()
        countdown.dataSource = self
        countdown.delegate = self
        // duration default to 3 min
        countdown.selectRow(3, inComponent: 0, animated: false)
        countdown.selectRow(60, inComponent: 2, animated: false)
        count.delegate = self
        count.duration = duration
        timeLabel.font = UIFont.monospacedDigitSystemFont(ofSize: timeLabel.font.pointSize, weight: .medium)
        startButton.button_ui()
        updateViews()
    }
    
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss.SS"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    private var duration: TimeInterval {
        // Convert from minutes + seconds to total seconds
        let minuteString = countdown.selectedRow(inComponent: 0)
        let secondString = countdown.selectedRow(inComponent: 2)
        let minutes = Int(minuteString)
        let seconds = Int(secondString)
        let totalSeconds = TimeInterval(minutes * 60 + seconds)
        return totalSeconds
    }
    
    lazy private var setPickerTime: [[String]] = {
        let minutes: [String] = Array(0...60).map { String($0) }
        let seconds: [String] = Array(0...59).map { String($0) }
        let data: [[String]] = [minutes, ["min"], seconds, ["sec"]]
        return data
    }()
    
    
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        count.start_timer()
        updateViews()
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "BreatheViewController") as! BreatheViewController
//        let navigationController = UINavigationController(rootViewController: vc)
//        self.present(navigationController, animated: true, completion: nil)
    }
    
    
    private func alertStoped() {
        let alert = UIAlertController(title: "Finished!", message: "", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    private func updateViews() {
        startButton.isEnabled = true
        switch count.state {
            case .started:  timeLabel.text = string(from: count.timeRemaining); startButton.isEnabled = false
            case .finished: timeLabel.text = string(from: 0)
            case .reset:    timeLabel.text = string(from: count.duration)
        }
    }
    
    private func string(from duration: TimeInterval) -> String {
        let date = Date(timeIntervalSinceReferenceDate: duration)
        return dateFormatter.string(from: date)
    }
}


extension SmallView: TimeDelegate {
    func count_finish() {
        updateViews()
        alertStoped()
    }
    
    func update_count(timeRemaining: TimeInterval) {
        updateViews()
    }
}

extension SmallView: UIPickerViewDataSource, UIPickerViewDelegate {
    // DataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return setPickerTime.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return setPickerTime[component].count
    }
    
    // Delegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let timeValue = setPickerTime[component][row]
        return String(timeValue)
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        count.duration = duration
        updateViews()
    }
}

