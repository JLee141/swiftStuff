//
//  AboutMe.swift
//  Thirst Counter
//
//  Created by Jordan Lee on 1/21/21.
//  Copyright © 2021 Jordan Lee. All rights reserved.
//

import SwiftUI

struct AboutMeView: View {
    @Namespace private var animation
    @State private var isFlipped = true
    @State private var isVisible = false
    
    
    var body: some View {
        
        VStack {
            Text("Howdy!")
                .font(.title)
                
            HStack {
                if isFlipped {
                Image("MimojiProfilePhotoThristCounter")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        Text("My name is Jordan Lee, I was born and raised in beautiful South Florida. I have always loved technology for as long as I remembered and started my professional career in Information Technology. I discovered my passion for UX Design and on my journey learned programming to showcase some of my vision. I'm continously learning and hope that one day my designs reflect humanity, functionality and taste.")
            .kerning(0.5)
            .padding()
            .font(.subheadline)
                }
            }
        }
        .padding()
    }
}

struct AboutMeView_Previews: PreviewProvider {
    static var previews: some View {
        AboutMeView()
    }
}
