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
        guard let name = name,
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
        //let identifier = identifier
        let daysArray = days.components(separatedBy: ",")
        return CourseRepresentation(identifier: Int(identifier),
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

    @discardableResult convenience init(identifier: Int = 0,
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
    }

    @discardableResult convenience init?(courseRepresentation: CourseRepresentation,
                                         context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {

        let identifier = courseRepresentation.identifier
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
