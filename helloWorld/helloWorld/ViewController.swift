//
//  ViewController.swift
//  helloWorld
//
//  Created by Jordan Lee on 4/2/19.
//  Copyright © 2019 Jordan Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressMeButton(_ sender: Any) {
        helloLabel.text = "World ;)"
        
    }
    
    @IBAction func resetButton(_ sender: Any) {
        if(helloLabel.text == "World ;)"){
            helloLabel.text = "Hello"
        }
    }
    


}

