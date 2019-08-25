//
//  ViewController.swift
//  Timer Count down
//
//  Created by Mohamed on 8/25/19.
//  Copyright © 2019 Mohamed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var releaseDate: NSDate?
    var countdownTimer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        startTimer()
    }
    func startTimer() {
        
        let releaseDateString = "2019-09-1 08:00:00"
        let releaseDateFormatter = DateFormatter()
        releaseDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        releaseDate = releaseDateFormatter.date(from: releaseDateString)! as NSDate
        
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        
        let currentDate = Date()
        let calendar = Calendar.current
        
        let diffDateComponents = calendar.dateComponents([.day, .hour, .minute, .second], from: currentDate, to: releaseDate! as Date)
        
        let countdown = "Days \(diffDateComponents.day ?? 0), Hours \(diffDateComponents.hour ?? 0), Minutes \(diffDateComponents.minute ?? 0), Seconds \(diffDateComponents.second ?? 0)"
        
        print(countdown)
    }

}

