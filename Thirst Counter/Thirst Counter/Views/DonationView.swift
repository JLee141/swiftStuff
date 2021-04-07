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
    
//ApplePay Implementation
let applePayHandeler = ApplePayHandler()
    
@State var input = NumbersOnly()
    
    var body: some View {
        VStack {
            Button(action: {
                impactHeavy.impactOccurred()
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName:"chevron.compact.down")
            }.padding()
            Spacer()
            Group {
                    VStack {
                        Image(
                            "MimojiProfilePhotoThristCounter")
                            .resizable()
                            .frame(width: 125, height: 125)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        Text("""
Thank you for using my app!

I hope it brings value into your life. I invite you to support me. I intend to keep this app free to help people reach their goals.
""")
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
//            Group {
//                VStack {
//                    HStack {
//                    Button(action: {
//                        impactHeavy.impactOccurred()
//                        //self.presentationMode.wrappedValue.dismiss()
//                        self.applePayHandeler.startPayment { success in
//                            if success {
//                                self.presentationMode.wrappedValue.dismiss()
//                            } else {
//                                self.presentationMode.wrappedValue.dismiss()
//                            }
//
//                        }
//                    }){
//                    Text("Donate $1  APPLE PAY")
//                        .font(Font.custom("HelveticaNeue-Bold", size: 16))
//                        .background(Color.secondary)
//                        .padding(10)
//                        .foregroundColor(.primary)
//                        .cornerRadius(10)
//                    Text("$1")
//                        .font(.title2)
//                    }
//                }
//                    .padding()
//                    HStack {
//                    Button(action: {
//                        impactHeavy.impactOccurred()
//                        self.presentationMode.wrappedValue.dismiss()
//                    }){
//                        Text("Kind Level :")
//                            .foregroundColor(.primary)
//                            .font(.title2)
//                        Text("$3")
//                            .font(.title2)
//                    }
//                }
//                .padding()
//                HStack {
//                    Button(action: {
//                        impactHeavy.impactOccurred()
//                        self.presentationMode.wrappedValue.dismiss()
//                    }){
//                        Text("Generous Level :")
//                            .foregroundColor(.primary)
//                            .font(.title2)
//                        Text("$10")
//                            .font(.title2)
//                    }
//                    .padding()
//                    }
//                HStack {
//                    Button(action: {
//                        impactHeavy.impactOccurred()
//                        self.presentationMode.wrappedValue.dismiss()
//                    }){
//                        TextField("Custom Donation", text: $input.value)
//                            .keyboardType(.numberPad)
//                            .multilineTextAlignment(.center)
//                            .padding()
//                            .font(.title3)
//                    }
//
//                }
//                }
//            Spacer()
//            }

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
