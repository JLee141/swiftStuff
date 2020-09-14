//
//  Buttons.swift
//  Thirst Counter
//
//  Created by Jordan Lee on 8/13/20.
//  Copyright © 2020 Jordan Lee. All rights reserved.
//

import SwiftUI

struct Buttons: View {
    var body: some View {
        VStack {
            Text("+")
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .frame(width: 60, height: 60)
                .background(Color.white)
            .cornerRadius(20)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .shadow(color: Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)), radius: 20, x: 20, y: 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}
