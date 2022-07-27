//
//  Timer.swift
//  Picsart Academy
//
//  Created by Sevak Tadevosyan on 05.06.22.
//

import Foundation
import UIKit

class TimerComponents {
    
    static let shared = TimerComponents()
    init() {}
    
    var monthLabel: UILabel = UILabel()
    var daysLabel: UILabel = UILabel()
    var hoursLabel: UILabel = UILabel()
    var minutesLabel: UILabel = UILabel()
    var buttonOne: UIButton = UIButton()
    var buttonTwo: UIButton = UIButton()
    var timer: Timer = Timer()
    
    func EventDate() -> DateComponents {
        var eventDateComponents = DateComponents()
        eventDateComponents.year = 2022
        eventDateComponents.month = 12
        eventDateComponents.day = 01
        eventDateComponents.hour = 00
        eventDateComponents.minute = 00
        eventDateComponents.second = 00
        eventDateComponents.timeZone = TimeZone(abbreviation: "GMT")
        return eventDateComponents
    }

    func getOutlets(monthLabel: UILabel, daysLabel: UILabel, hoursLabel: UILabel, minutesLabel: UILabel, timer: Timer) {
        self.monthLabel = monthLabel
        self.daysLabel = daysLabel
        self.hoursLabel = hoursLabel
        self.minutesLabel = minutesLabel
        
        self.timer = timer
    }
    func getButtons(buttonOne: UIButton, buttonTwo: UIButton) {
        self.buttonOne = buttonOne
        self.buttonTwo = buttonTwo
    }
    @objc func UpdateTime() {
        let userCalendar = Calendar.current
        let date = Date()
        let components = userCalendar.dateComponents([.year,
                                                      .month,
                                                      .day,
                                                      .hour,
                                                      .minute,
                                                      .second],
                                                     from: date)
        let currentDate = userCalendar.date(from: components)!
        let eventDate = userCalendar.date(from: EventDate())!
        let timeLeft = userCalendar.dateComponents([.month,
                                                    .day,
                                                    .hour,
                                                    .minute],
                                                   from: currentDate,
                                                   to: eventDate)
        if let month = timeLeft.month,
           let days = timeLeft.day,
           let hours = timeLeft.hour,
           let minutes = timeLeft.minute {
            monthLabel.text = month.formatWithZeros()
            daysLabel.text = days.formatWithZeros()
            hoursLabel.text = hours.formatWithZeros()
            minutesLabel.text = minutes.formatWithZeros()
            
        }
        endEvent(buttonOne: buttonOne, buttonTwo: buttonTwo, currentdate: currentDate, eventdate: eventDate, timer: timer)
    }
    func endEvent(buttonOne: UIButton, buttonTwo: UIButton, currentdate: Date, eventdate: Date, timer: Timer) {
        if currentdate >= eventdate {
            buttonOne.isEnabled = true
            buttonTwo.isEnabled = true
            timer.invalidate()
        }
    }
}
