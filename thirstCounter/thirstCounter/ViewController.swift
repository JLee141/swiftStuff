//
//  ViewController.swift
//  thirstCounter
//
//  Created by Jordan Lee on 2/5/19.
//  Copyright © 2019 Jordan Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greetingView: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        greetingView.text = "Hello!"
    }
    


}

