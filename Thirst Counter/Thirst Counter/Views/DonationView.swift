//
//  DonationView.swift
//  Thirst Counter
//
//  Created by Jordan Lee on 1/14/21.
//  Copyright © 2021 Jordan Lee. All rights reserved.
//

import SwiftUI

struct DonationView: View {
//This dismisses the view once a button is hit
@Environment(\.presentationMode) var presentationMode

//Haptic feedback when button is pressed to dismiss
let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
    var body: some View {
        VStack {
            Spacer()
                .padding(.top)
            Text("Tip Jar! 👋🏼")
                .font(.title)
            Spacer()
            Text("")
            Text("Thank you for using my app! I hope it brings value into your life. I invite you to support me if you can. I intend to keep this app free to help people reach their goals 😊")
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
            VStack {
                Spacer()
            HStack {
                Spacer()
                Button(action: {
                    impactHeavy.impactOccurred()
                    self.presentationMode.wrappedValue.dismiss()
                }){
                Text("Courteous Level 1️⃣")
                .font(.title3)
                }
                Spacer()
            }
            .padding()
            HStack {
                Spacer()
                Button(action: {
                    impactHeavy.impactOccurred()
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Text("Kind Level 5️⃣")
                    .font(.title3)
                }
                Spacer()
            }
            .padding()
            HStack {
                Spacer()
                Button(action: {
                    impactHeavy.impactOccurred()
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Text("Generous Level 🔟")
                    .font(.title3)
                }
                Spacer()
            }
            .padding()
                Spacer()
            }
            Spacer()
        }
    }
}

struct DonationView_Previews: PreviewProvider {
    static var previews: some View {
        DonationView()
    }
}
