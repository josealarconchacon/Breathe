//
//  Count.swift
//  Breathe
//
//  Created by Jose Alarcon Chacon on 12/2/20.
//

import Foundation


protocol TimeDelegate: AnyObject {
    func update_count(timeRemaining: TimeInterval)
    func count_finish()
}

// Enum to track state of countdown
enum CountState {
    case started
    case finished
    case reset
}

class Time {
    weak var delegate: TimeDelegate?
    // number of seconds; countdown's starting value
    var duration: TimeInterval
    
    var timeRemaining: TimeInterval {
        if let stop = stopDate {
            let timeRemaining = stop.timeIntervalSinceNow
            return timeRemaining
        } else {
            return 0
        }
    }
    
    private var timer: Timer?
    private var stopDate: Date?
    
    // current state of countdown
    private(set) var state: CountState
    
    init() {
        timer = nil
        stopDate = nil
        duration = 0
        state = .reset
    }
    
    func start_timer() {
        // Cancel timer before starting new timer
        cancel_timer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true, block: updateTimer(timer:))
        stopDate = Date(timeIntervalSinceNow: duration)
        state = .started
    }
    
    func reset() {
        stopDate = nil
        cancel_timer()
        state = .reset
    }
    
    func cancel_timer() {
        // We must invalidate a timer, or it will continue to run even if we
        // start a new timer
        timer?.invalidate()
        timer = nil
    }
    
    // called each time the timer object fires
    // (300 times per second in this app)
    private func updateTimer(timer: Timer) {
        if let stopDate = stopDate {
            let currentTime = Date()
            if currentTime <= stopDate {
                // Timer is active, keep counting down
                delegate?.update_count(timeRemaining: timeRemaining)
            } else {
                // Timer is finished, reset and stop counting down
                state = .finished
                cancel_timer()
                self.stopDate = nil
                delegate?.count_finish()
            }
        }
    }
}
