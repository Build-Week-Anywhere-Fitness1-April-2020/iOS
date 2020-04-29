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
        guard let identifier = identifier,
            let name = name, let time = time,
            let startDate = startDate,
            let location = location,
            let classType = classType,
            let imageURL = imageURL,
            let courseDescription = courseDescription,
            let registeredAttendees = registeredAttendees,
            let instructor = instructor,
            let days = days,
            let address = address
            else { return nil }
        return CourseRepresentation(identifier: identifier.uuidString,
                                    name: name,
                                    time: time,
                                    duration: duration,
                                    startDate: startDate,
                                    intensity: intensity ?? "medium",
                                    location: location,
                                    maxSize: Int(maxSize),
                                    classType: classType,
                                    imageURL: imageURL,
                                    courseDescription: courseDescription,
                                    cost: cost,
                                    registeredAttendees: registeredAttendees,
                                    instructor: instructor,
                                    days: days,
                                    address: address,
                                    equipmentRequired: equipmentRequired ?? "None",
                                    arrivalDescription: arrivalDescription ?? "Come ready and excited for class!!",
                                    additionalInfo: additionalInfo ?? "None")}

    @discardableResult convenience init(identifier: UUID = UUID(),
                                        name: String,
                                        time: String,
                                        duration: Double,
                                        startDate: String,
                                        intensity: String,
                                        location: String,
                                        maxSize: Int,
                                        classType: String,
                                        imageURL: String,
                                        courseDescription: String,
                                        cost: Double,
                                        registeredAttendees: String,
                                        instructor: String,
                                        days: String,
                                        address: String,
                                        equipmentRequired: String,
                                        arrivalDescription: String,
                                        additionalInfo: String,
                                        context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {

        self.init(context: context)
    }

    @discardableResult convenience init?(courseRepresentation: CourseRepresentation,
                                         context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {

        guard let identifier = UUID(uuidString: courseRepresentation.identifier ?? "myid") else { return nil }

        self.init(identifier: identifier,
                  name: courseRepresentation.name,
                  time: courseRepresentation.time,
                  duration: courseRepresentation.duration,
                  startDate: courseRepresentation.startDate,
                  intensity: courseRepresentation.intensity,
                  location: courseRepresentation.location,
                  maxSize: courseRepresentation.maxSize,
                  classType: courseRepresentation.classType,
                  imageURL: courseRepresentation.imageURL,
                  courseDescription: courseRepresentation.courseDescription,
                  cost: courseRepresentation.cost,
                  registeredAttendees: courseRepresentation.registeredAttendees ?? "None",
                  instructor: courseRepresentation.instructor,
                  days: courseRepresentation.days,
                  address: courseRepresentation.address,
                  equipmentRequired: courseRepresentation.equipmentRequired,
                  arrivalDescription: courseRepresentation.arrivalDescription  ,
                  additionalInfo: courseRepresentation.additionalInfo,
                  context: context)
    }
}
