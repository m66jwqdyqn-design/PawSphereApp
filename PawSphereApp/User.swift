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
    var username: String
    var password: String
    init(username: String, password: String) {
        self.username = username
        self.password = password        
    }
}
