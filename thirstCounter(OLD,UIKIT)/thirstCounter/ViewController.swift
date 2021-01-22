//
//  ViewController.swift
//  thirstCounter
//
//  Created by Jordan Lee on 2/5/19.
//  Copyright © 2019 Jordan Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var systemDate = NSDate()
    var currentTime: Int = 0
    var systemCalendar = NSCalendar.current
    
    @IBOutlet weak var greetingView: UILabel!
    
    @IBOutlet weak var waterRecord: UIButton!
    @IBOutlet weak var snapRecordButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        if(hour<12){
            greetingView.text = "Howdy! Good Morning! What would you like to do?"
        }else if(hour<16)&&(hour>12){
            greetingView.text = "Howdy! Good afternoon! What would you like to do?"
        }else{
            greetingView.text = "Howdy! Hope you are having a great night! What would you like to do?"
        }
    }
    


}

