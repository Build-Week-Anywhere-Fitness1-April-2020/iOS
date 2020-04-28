//
//  ClassController.swift
//  AnywhereFitness
//
//  Created by Mark Poggi on 4/27/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import Foundation
import CoreData

enum NetworkError: Error {
    case noIdentifier
    case otherError
    case noData
    case noDecode
    case noEncode
    case noRep
}

class CourseController {

    // MARK: - Properties
    var searchedCourses: [CourseRepresentation] = []

    typealias CompletionHandler = (Result<Bool, NetworkError>) -> Void

    private let baseURL = URL(string: "https://anywherefitness-api.herokuapp.com/")!

    // MARK: - Methods
    func fetchCourses(completion: @escaping CompletionHandler = { _ in }) {
         let requestURL = baseURL.appendingPathExtension("classes")

         URLSession.shared.dataTask(with: requestURL) { data, _, error in
             if let error = error {
                 NSLog("Error fetching classes: \(error)")
                 completion(.failure(.otherError))
                 return
             }

             guard let data = data else {
                 NSLog("No data returned from fetch")
                 completion(.failure(.noData))
                 return
             }

             do {
         let courseRepresentations =
             Array(try JSONDecoder().decode([String: CourseRepresentation].self, from: data).values)
                 try self.updateCourses(with: courseRepresentations)

                 completion(.success(true))
             } catch {
                 NSLog("Error decoding classes from server: \(error)")
                 completion(.failure(.noDecode))
             }
         }.resume()
     }

    func searchForCourse(with searchTerm: String, completion: @escaping (Error?) -> Void) {
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let queryParameters = ["classes": searchTerm]
        components?.queryItems = queryParameters.map({URLQueryItem(name: $0.key, value: $0.value)})

        guard let requestURL = components?.url else {
            completion(NSError())
            return
        }

        URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
            if let error = error {
                NSLog("Error searching for class with search term \(searchTerm): \(error)")
                completion(error)
                return
            }

            guard let data = data else {
                NSLog("No data returned from data task")
                completion(NSError())
                return
            }

            do {
                let courseRepresentations = try JSONDecoder().decode(CourseRepresentations.self, from: data).results
                self.searchedCourses = courseRepresentations
                completion(nil)
            } catch {
                NSLog("Error decoding JSON data: \(error)")
                completion(error)
            }
        }.resume()
    }

    private func updateCourses(with representations: [CourseRepresentation]) throws {
        let identifiersToFetch = representations.compactMap {UUID(uuidString: $0.identifier!) }
        let representationsByID = Dictionary(uniqueKeysWithValues: zip(identifiersToFetch, representations))

        var coursesToCreate = representationsByID
        let fetchRequest: NSFetchRequest<Course> = Course.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "identifier IN %@", identifiersToFetch)

        let context = CoreDataStack.shared.container.newBackgroundContext()

        context.perform {
            do {
                let existingCourses = try context.fetch(fetchRequest)
                for course in existingCourses {
                    guard let identifier = course.identifier,
                        let representation = representationsByID[identifier] else { continue }
                    self.update(course: course, with: representation)
                    coursesToCreate.removeValue(forKey: identifier)
                }

                for representation in coursesToCreate.values {
                    Course(courseRepresentation: representation, context: context)
                }
                try context.save()
            } catch {
                NSLog("error fetching courses with UUIDs: \(identifiersToFetch), with error: \(error)")
            }
        }
    }
    private func update(course: Course, with representation: CourseRepresentation) {
        course.name = representation.name
        course.time = representation.time
        course.duration = representation.duration
        course.startDate = representation.startDate
        course.intensity = representation.intensity
        course.location = representation.location
        course.maxSize = Int16(representation.maxSize)
        course.classType = representation.classType
        course.imageURL = representation.imageURL
        course.courseDescription = representation.courseDescription
        course.cost = representation.cost
        course.registeredAttendees = representation.registeredAttendees ?? "None"
        course.instructor = representation.instructor
        course.days = representation.days
        course.address = representation.address
        course.equipmentRequired = representation.equipmentRequired
        course.arrivalDescription = representation.arrivalDescription
        course.additionalInfo = representation.additionalInfo
    }
}
