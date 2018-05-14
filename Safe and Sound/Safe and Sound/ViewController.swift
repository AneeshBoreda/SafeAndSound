//
//  ViewController.swift
//  Safe and Sound
//
//  Created by Medha Gupta on 3/24/18.
//  Copyright © 2018 HackUVA. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    var timer = Timer()
    var seconds = 60
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        runTimer()
        
        
    }
    
    func runTimer()
    {
        timer = Timer.scheduledTimer(timeInterval: 1, target:self, selector:(#selector(ViewController.updateTimer)), userInfo:nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func updateTimer()
    {
        seconds-=1
        if(seconds < 0)
        {
            timer.invalidate()
            let content = UNMutableNotificationContent()
            content.title = NSString.localizedUserNotificationString(forKey: "Warning!", arguments: nil)
            content.body = NSString.localizedUserNotificationString(forKey: "You are in a danger zone!",
                                                                    arguments: nil)
            
            // Configure the trigger for a 7am wakeup.
            var dateInfo = DateComponents()
            dateInfo.hour = 7
            dateInfo.minute = 0
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateInfo, repeats: false)
            
            // Create the request object.
            let request = UNNotificationRequest(identifier: "DangerWarning", content: content, trigger: trigger)
        }
    }
    }




