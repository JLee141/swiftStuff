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
    var greeting = "Hello"
    @IBOutlet weak var easterEggLabel: UILabel!
    let easterEggResponse = "You just activated my trap card, you pressed reset even though you didn't need too. I will now banish you to the shadow realm!"
    
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
            easterEggLabel.text = ""
        }else if(helloLabel.text==greeting || helloLabel.text==greeting.lowercased()){
            easterEggLabel.text = easterEggResponse
        }
    }
    
}

