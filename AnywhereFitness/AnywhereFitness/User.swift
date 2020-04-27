//
//  User.swift
//  AnywhereFitness
//
//  Created by Mark Poggi on 4/27/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import Foundation

struct User: Codable {
    let identifier: Int
    let displayName: String
    let username: String
    let password: String
    let name: String
    let email: String
    let role: [String]
    let gender: String
    let location: String?
    var coursesEnrolled: [CourseRepresentation]
    var coursesTeaching: [CourseRepresentation]
}

enum Role: String, Codable {
    case instructor
    case client
}

enum Gender: String, Codable {
    case male
    case female
    case nonbinary
}
