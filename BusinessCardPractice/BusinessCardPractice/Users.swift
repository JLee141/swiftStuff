//
//  Users.swift
//  BusinessCardPractice
//
//  Created by Jordan Lee on 7/28/20.
//  Copyright © 2020 Jordan Lee. All rights reserved.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    let firstName: String
    let lastName: String
    let title: String
    var email: String
    var companyURL: String
    var address: String
}
//extension User {
//    init(fName: String, lName: String, title: String, email: String) {
//        self.firstName = fName
//        self.lastName = lName
//        self.title = title
//        self.email = email
//        self.companyURL = ""
//        self.address = ""
//    }
//}
