//
//  User.swift
//  PawSphereApp
//
//  Created by Maryam Ahmad on 11/11/2026.
//

import Foundation
import SwiftData

@Model
class User{
    var email: String
    var username: String
    var password: String
    init(email: String, username: String, password: String) {
        self.email = email
        self.username = username
        self.password = password        
    }
}
