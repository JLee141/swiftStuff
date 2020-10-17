//
//  labelView.swift
//  QuickCard
//
//  Created by Jordan Lee on 9/13/20.
//  Copyright © 2020 Jordan Lee. All rights reserved.
//

import SwiftUI
import UIKit

struct labelView: View {
    
    @State var aName: String = " "
    @State var yourName: String = " "

    var body: some View {
        
        VStack {
            TextField("Enter Name", text: $aName)
        }
        
    }
}

struct labelView_Previews: PreviewProvider {
    static var previews: some View {
        labelView()
    }
}
