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

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

class CourseController {

    // MARK: - Properties
    var courses: [CourseRepresentation] = []
    var allCourses: [CourseRepresentation] = []
    static let shared = CourseController()
    let jsonDecoder = JSONDecoder()
    let jsonEncoder = JSONEncoder()

    typealias CompletionHandler = (Result<Bool, NetworkError>) -> Void

    private let baseURL = URL(string: "https://anywherefitness-api.herokuapp.com/")!

    let classTypeArray: [[String]] = [["Class Type"], ["Yoga", "Weightlifting", "Crossfit", "Pilates"]]
    let courseIntensityArray: [[String]] = [["Class Level"], ["Beginner", "Intermediate", "Advanced"]]

    // MARK: - Methods
    func fetchCourses(completion: @escaping (Result<[CourseRepresentation], NetworkError>) -> Void) {

        do {
            let data = jsonData

            let courseRepresentations = try jsonDecoder.decode([ CourseRepresentation].self, from: data)
            try self.updateCourses(with: courseRepresentations)
            completion(.success(courseRepresentations))
        } catch {
            NSLog("Error decoding classes from server: \(error)")
            completion(.failure(.noDecode))
        }

        //        guard let bearer = UserController.shared.bearer else {
        //            print("bearer for fetching courses is missing")
        //            return
        //        }
        //
        //        let requestURL = baseURL.appendingPathExtension("classes")
        //
        //        var request = URLRequest(url: requestURL)
        //
        //        request.httpMethod = HTTPMethod.get.rawValue
        //        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //        request.addValue(bearer.token, forHTTPHeaderField: "Authorization")
        //        URLSession.shared.dataTask(with: request) { data, response, error in
        //
        //            if let response = response as? HTTPURLResponse,
        //                response.statusCode != 200 {
        //                completion(.failure(.noRep))
        //            }
        //
        //            if let error = error {
        //                NSLog("Error fetching classes: \(error)")
        //                completion(.failure(.otherError))
        //                return
        //            }
        //
        //            guard let data = data else {
        //                NSLog("No data returned from fetch")
        //                completion(.failure(.noData))
        //
        //                return
        //            }
        //
        //            do {
        //                print("\(data)")
        //                let courseRepresentations = try self.jsonDecoder.decode([CourseRepresentation].self,
        //                        from: data)
        //                print(courseRepresentations)
        //                completion(.success(courseRepresentations))
        //            } catch {
        //                NSLog("Error decoding classes from server: \(error)")
        //                completion(.failure(.noDecode))
        //            }
        //        }.resume()
    }

    func searchForCourse(with searchTerm: String, completion: @escaping CompletionHandler = { _ in }) {
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let queryParameters = ["classes": searchTerm]
        components?.queryItems = queryParameters.map({URLQueryItem(name: $0.key, value: $0.value)})

        guard let requestURL = components?.url else {
            completion(.failure(.otherError))
            return
        }
        URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
            if let error = error {
                NSLog("Error searching for class with search term \(searchTerm): \(error)")
                completion(.failure(.otherError))
                return
            }
            guard let data = data else {
                NSLog("No data returned from data task")
                completion(.failure(.noData))
                return
            }
            do {
                let courseRepresentations = try JSONDecoder().decode(CourseRepresentations.self, from: data).results
                self.courses = courseRepresentations
                completion(.success(true))
            } catch {
                NSLog("Error decoding JSON data: \(error)")
                completion(.failure(.noDecode))
            }
        }.resume()
    }

    func createCourse(name: String,
                      duration: Double,
                      maxSize: Int,
                      classType: String,
                      instructor: String) -> CourseRepresentation {

        let course = CourseRepresentation(name: name,
                                          duration: duration,
                                          maxSize: maxSize,
                                          classType: classType,
                                          instructor: instructor)
        return course
    }

    func postClass(course: CourseRepresentation, completion: @escaping CompletionHandler = { _ in }) {

        let createClassURL = self.baseURL.appendingPathComponent("classes")

        guard let bearer = UserController.shared.bearer else {
            completion(.failure(.noRep))
            return
        }

        var request = URLRequest(url: createClassURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(bearer.token, forHTTPHeaderField: "Authorization")

        do {
            let jsonData = try jsonEncoder.encode(course)
            request.httpBody = jsonData
        } catch {
            NSLog("Error enconding user objects: \(error)")
            completion(.failure(.noEncode))
            return
        }

        URLSession.shared.dataTask(with: request) { (_, response, error) in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                completion(.failure(.noRep))
                return
            }
            if let error = error {
                NSLog("print \(error)")
                completion(.failure(.otherError))
                return
            }
            self.courses.append(course)
        } .resume()
    }

    func postAttendee(courseID: Int, completion: @escaping CompletionHandler = { _ in }) {

        let addAttendeeURL = self.baseURL.appendingPathComponent("classes/add-attendee")

        guard let bearer = UserController.shared.bearer else {
            completion(.failure(.noRep))
            return
        }

        var request = URLRequest(url: addAttendeeURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(bearer.token, forHTTPHeaderField: "Authorization")

        let accountID = UserDefaults.standard.integer(forKey: "userID")
        let attendee = AddAttendee(accountID: accountID, classID: courseID)

        do {
            let jsonData = try jsonEncoder.encode(attendee)
            request.httpBody = jsonData
        } catch {
            NSLog("Error enconding user objects: \(error)")
            completion(.failure(.noEncode))
            return
        }

        URLSession.shared.dataTask(with: request) { (_, response, error) in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 201 {
                completion(.failure(.noRep))
                return
            }
            if let error = error {
                NSLog("print \(error)")
                completion(.failure(.otherError))
                return
            }
            completion(.success(true))
        } .resume()
    }

    private func updateCourses(with representations: [CourseRepresentation]) throws {

        let identifiersToFetch = representations.compactMap {String($0.identifier) }

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

                for representation in coursesToCreate {
                    Course(courseRepresentation: representation.value, context: context)
                }
                try context.save()
            } catch {
                NSLog("error fetching courses with id's: \(identifiersToFetch), with error: \(error)")
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
        course.imgURL = representation.imgURL
        course.courseDescription = representation.courseDescription
        course.cost = representation.cost
        course.instructor = representation.instructor
        let days = representation.days.joined(separator: ",")
        course.days = days
        course.address = representation.address
        course.equipmentRequired = representation.equipmentRequired
        course.arrivalDescription = representation.arrivalDescription
        course.additionalInfo = representation.additionalInfo
    }
}
