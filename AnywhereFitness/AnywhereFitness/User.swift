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
    let email: String
    let password: String
    let gender: String
    let displayName: String
    let roles: [String]
}

//struct UserReturn: Codable {
//    let identifier: Int
//    let username: String
//    let email: String
//    let displayName: String
//    let gender: String
//    
//    enum UserReturnKeys: String, CodingKeys {
//        case identifier = "id"
//        case username, email, displayName, gender
//    }
//}

struct UserSignIn: Codable {
    let username: String
    let password: String
    let role: String
}

struct AddAttendee: Codable {
    let accountID: Int
    let classID: Int
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

enum UserDefaultKeys: String {
    case user = "User Name"
}
