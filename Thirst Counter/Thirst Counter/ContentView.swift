//
//  ContentView.swift
//  Thirst Counter
//
//  Created by Jordan Lee on 7/10/20.
//  Copyright © 2020 Jordan Lee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var amountOfWater:Int = 0
    var body: some View {
        //Testing out Button Actions in the view
       Button(action:
        {
            
        
        }) {
           HStack {
            //Testing out plus button using system images
            Image(systemName: "plus")
                   .font(.title)
           }
           .padding()
           .foregroundColor(.white)
           .background(Color.blue)
           .cornerRadius(.infinity)
           .shadow(color: Color.blue, radius: 20, y: 5)
       }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
