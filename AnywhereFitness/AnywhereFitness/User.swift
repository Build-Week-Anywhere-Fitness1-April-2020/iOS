//
//  User.swift
//  AnywhereFitness
//
//  Created by Mark Poggi on 4/27/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import Foundation

struct User: Codable {
    let name: String
    let identifier: Int
    let displayName: String
    let gender: String
    let location: String?
    var coursesEnrolled: [CourseRepresentation]
    var coursesTeaching: [CourseRepresentation]
}

struct UserLogin: Codable {
    let username: String
    let email: String?
    let password: String
    let roles: [String]
}

enum Role: String, Codable {
    case instructor
    case client
}

enum Gender: String, Codable {
    case male = "Male"
    case female = "Female"
    case nonbinary = "Non-binary"
}
