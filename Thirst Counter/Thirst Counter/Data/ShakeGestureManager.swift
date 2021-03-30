//
//  ShakeGestureManager.swift
//  Thirst Counter
//
//  Created by Jordan Lee on 3/23/21.
//  Copyright © 2021 Jordan Lee. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

let messagePublisher = PassthroughSubject<Void, Never>()

class ShakableViewController: UIViewController {

    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        messagePublisher.send()
    }
}

struct ShakableViewRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> ShakableViewController {
        ShakableViewController()
    }
    
    func updateUIViewController(_ uiViewController: ShakableViewController, context: Context) {
        
    }
}
