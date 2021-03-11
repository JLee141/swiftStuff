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
let impactMedium = UIImpactFeedbackGenerator(style: .medium)
    var body: some View {
        VStack {
            Button(action: {
                impactHeavy.impactOccurred()
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName:"chevron.compact.down")
            }.padding()
            
            Group {
                    VStack {
                        Image(
                            "MimojiProfilePhotoThristCounter")
                            .resizable()
                            .frame(width: 125, height: 125)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        Text("Thank you for using my app! I hope it brings value into your life. I invite you to support me if you can. I intend to keep this app free to help people reach their goals.")
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                Group {
                    HStack {
                            Spacer()
                            Link(destination: URL(string: "https://twitter.com/jslee14")!) {
                                    Image("008-twitter")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                            }
                            Link(destination: URL(string: "https://www.linkedin.com/in/jslee14/")!) {
                                    Image("027-linkedin")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                            }
                            Link(destination: URL(string: "https://jordanslee.medium.com")!, label: {
                                Image("026-medium")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            })
                            Spacer()
                    }
                }
            }
            Spacer()
            Group {
                VStack {
                    HStack {
                    Button(action: {
                        impactHeavy.impactOccurred()
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                    Text("Courteous Level : 1️⃣ Dollar")
                        .font(.title3)
                    }
                }
                    .padding()
                    HStack {
                    Button(action: {
                        impactHeavy.impactOccurred()
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        Text("Kind Level :  5️⃣ Dollars")
                        .font(.title3)
                    }
                }
                .padding()
                HStack {
                    Button(action: {
                        impactHeavy.impactOccurred()
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        Text("Generous Level : 🔟 Dollars")
                        .font(.title3)
                    }
                    .padding()
                    }
                }
            }
            
            
            Spacer()
            HStack {
                Button(action: {
                    impactMedium.impactOccurred()
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Text("Not Right Now").font(.title3).background(Color.blue).foregroundColor(Color.white).cornerRadius(10).padding(.horizontal, 20)
                        .shadow(color: Color.black.opacity(0.5), radius: 10, x: 0, y: 5)
                }
            }
            .padding()
        }
    }
}

struct DonationView_Previews: PreviewProvider {
    static var previews: some View {
        DonationView()
    }
}
