//
//  ClassRepresentation.swift
//  AnywhereFitness
//
//  Created by Mark Poggi on 4/27/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import Foundation

struct CourseRepresentation: Equatable, Codable {

    var identifier: Int
    var name: String
    var time: String
    var duration: Double
    var startDate: String
    var intensity: String
    var location: String
    var maxSize: Int
    var classType: Int
    var imgURL: Int
    var courseDescription: String
    var cost: Double
    var instructor: Int
    var days: [String]
    var address: String
    var equipmentRequired: String
    var arrivalDescription: String
    var additionalInfo: String?

    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name, time, duration, intensity, location, maxSize, classType
        case imgURL = "imgUrl"
        case equipmentRequired, arrivalDescription, additionalInfo,
        cost, courseDescription, address, startDate, instructor, days
    }

    internal init(identifier: Int = 0,
                  name: String,
                  time: String = "",
                  duration: Double,
                  startDate: String = "",
                  intensity: String = "",
                  location: String = "",
                  maxSize: Int = 0,
                  classType: Int = 0,
                  imgURL: Int = 1,
                  courseDescription: String = "",
                  cost: Double = 0,
                  instructor: Int = 0,
                  days: [String] = [],
                  address: String = "",
                  equipmentRequired: String = "",
                  arrivalDescription: String = "",
                  additionalInfo: String = "") {

        self.identifier = identifier
        self.name = name
        self.time = time
        self.duration = duration
        self.startDate = startDate
        self.intensity = intensity
        self.location = location
        self.maxSize = maxSize
        self.classType = classType
        self.imgURL = imgURL
        self.courseDescription = courseDescription
        self.cost = cost
        self.instructor = instructor
        self.days = days
        self.address = address
        self.equipmentRequired = equipmentRequired
        self.arrivalDescription = arrivalDescription
        self.additionalInfo = additionalInfo
    }
}

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
