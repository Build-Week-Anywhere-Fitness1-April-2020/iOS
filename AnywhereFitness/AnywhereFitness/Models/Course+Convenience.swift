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
                                    registeredAttendees: [registeredAttendees],
                                    instructor: instructor,
                                    days: [days],
                                    address: address,
                                    equipmentRequired: equipmentRequired ?? "None",
                                    arrivalDescription: arrivalDescription ?? "Come ready and excited for class!!",
                                    additionalInfo: additionalInfo ?? "None")}
//    @discardableResult convenience init(identifier: UUID = UUID(),
//                                        title: String,
//                                        hasWatched: Bool = false,
//                                        context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
//
//        self.init(context: context)
//        //        self.identifier = identifier
//        //        self.title = title
//        //        self.hasWatched = hasWatched
//    }
//
//    @discardableResult convenience init?(courseRepresentation: CourseRepresentation, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
//
//        guard let identifier = identifier else { return nil }
//
//        self.init(identifier: identifier,
//
//                  context: context)
//    }
}
