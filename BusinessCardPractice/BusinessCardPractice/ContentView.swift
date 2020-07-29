//
//  ContentView.swift
//  BusinessCardPractice
//
//  Created by Jordan Lee on 7/27/20.
//  Copyright © 2020 Jordan Lee. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Jordan Lee")
                .font(.title)
            Text("Early Programmer")
                .italic()
            
            Image(systemName: "envelope.fill")
                .foregroundColor(.orange)
                Text("jlee@tecintl.com")
            Image(systemName: "link")
                .foregroundColor(.orange)
            Text("Address")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
