//
//  ButtonTest.swift
//  Thirst Counter
//
//  Created by Jordan Lee on 12/23/20.
//  Copyright © 2020 Jordan Lee. All rights reserved.
//

import SwiftUI

struct ButtonTest: View {
    var body: some View {
        VStack {
            Text("➕")
                    .font(.system(size: 25, weight: .bold, design: .rounded))
                    .frame(width: 75, height: 75)
                    .background(
                        ZStack {
                            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))
                            Circle()
                                .foregroundColor(.white)
                                .blur(radius: 4)
                                .offset(x: -8, y: -8)

                            Circle()
                                .fill(
                                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9019607843, green: 0.9294117647, blue: 0.9882352941, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                    )
                                .padding(2)
                                .blur(radius: 2)
                        }
                    )
                    .clipShape(Circle())
                    .shadow(color: Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: 0, y: 0)
                .shadow(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), radius: 20, x: -20, y: -10)
        }
        //.frame(maxWidth: .infinity, maxHeight: .infinity)
        //.background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ButtonTest_Previews: PreviewProvider {
    static var previews: some View {
        ButtonTest()
    }
}
