//
//  ClassRepresentation.swift
//  AnywhereFitness
//
//  Created by Mark Poggi on 4/27/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import Foundation

struct CourseRepresentation: Equatable, Codable {
    var identifier: String?
    var name: String
    var time: String // Will need to be compatible with database.
    var duration: Double
    var startDate: String
    var intensity: String
    var location: String
    var maxSize: Int
    var classType: String
    var imageURL: String
    var courseDescription: String
    var cost: Double
    var registeredAttendees: [String]?
    var instructor: String
    var days: [String]
    var address: String  // Needs to be compatible with Apple Maps.
    var equipmentRequired: String
    var arrivalDescription: String
    var additionalInfo: String
}

//struct ImgOptions: Codable {
//    var identifier: Int
//    var url: String
//}
//
//struct ClassTypes: Codable {
//    var identifier: Int
//    var type: Int  // Convert to String
//}

struct CourseRepresentations: Codable {
    let results: [CourseRepresentation]
}

extension String {
    static let beginner = "Beginner"
    static let intermediate = "Intermediate"
    static let advanced = "Advanced"
    static let monday = "Monday"
    static let tuesday = "Tuesday"
    static let wednesday = "Wednesday"
    static let thursday = "Thursday"
    static let friday = "Friday"
    static let saturday = "Saturday"
    static let sunday = "Sunday"
}
