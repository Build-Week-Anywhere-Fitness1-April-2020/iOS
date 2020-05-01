//
//  Class+Convenience.swift
//  AnywhereFitness
//
//  Created by Mark Poggi on 4/27/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import Foundation
import CoreData

extension Course {
    var courseRepresentation: CourseRepresentation? {
        guard let identifier = Int(identifier ?? "0"),
            let name = name,
            let time = time,
            let startDate = startDate,
            let location = location,
            let classType = classType,
            let imgURL = imgURL,
            let courseDescription = courseDescription,
            let instructor = instructor,
            let days = days,
            let address = address
            else { return nil }

        let daysArray = days.components(separatedBy: ",")
        return CourseRepresentation(identifier: identifier,
                                    name: name,
                                    time: time,
                                    duration: duration,
                                    startDate: startDate,
                                    intensity: intensity ?? "medium",
                                    location: location,
                                    maxSize: Int(maxSize),
                                    classType: classType,
                                    imgURL: imgURL,
                                    courseDescription: courseDescription,
                                    cost: cost,
                                    instructor: instructor,
                                    days: daysArray,
                                    address: address,
                                    equipmentRequired: equipmentRequired ?? "None",
                                    arrivalDescription: arrivalDescription ?? "Come ready and excited for class!!",
                                    additionalInfo: additionalInfo ?? "None")}

    @discardableResult convenience init(identifier: String,
                                        name: String,
                                        time: String,
                                        duration: Double,
                                        startDate: String,
                                        intensity: String,
                                        location: String,
                                        maxSize: Int,
                                        classType: String,
                                        imgURL: String,
                                        courseDescription: String,
                                        cost: Double,
                                        instructor: String,
                                        days: String,
                                        address: String,
                                        equipmentRequired: String,
                                        arrivalDescription: String,
                                        additionalInfo: String?,
                                        context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {

        self.init(context: context)
        self.identifier = identifier
        self.name = name
        self.time = time
        self.duration = duration
        self.startDate = startDate
        self.intensity = intensity
        self.location = location
        self.maxSize = Int16(maxSize)
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

    @discardableResult convenience init?(courseRepresentation: CourseRepresentation,
                                         context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {

        let identifier = String(courseRepresentation.identifier)
        let days = courseRepresentation.days.joined(separator: ",")

        self.init(identifier: identifier,
                  name: courseRepresentation.name,
                  time: courseRepresentation.time,
                  duration: courseRepresentation.duration,
                  startDate: courseRepresentation.startDate,
                  intensity: courseRepresentation.intensity,
                  location: courseRepresentation.location,
                  maxSize: courseRepresentation.maxSize,
                  classType: courseRepresentation.classType,
                  imgURL: courseRepresentation.imgURL,
                  courseDescription: courseRepresentation.courseDescription,
                  cost: courseRepresentation.cost,
                  instructor: courseRepresentation.instructor,
                  days: days,
                  address: courseRepresentation.address,
                  equipmentRequired: courseRepresentation.equipmentRequired,
                  arrivalDescription: courseRepresentation.arrivalDescription,
                  additionalInfo: courseRepresentation.additionalInfo,
                  context: context)
    }
}
