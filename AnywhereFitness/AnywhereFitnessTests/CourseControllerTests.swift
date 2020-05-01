//
//  CourseControllerTests.swift
//  AnywhereFitnessTests
//
//  Created by Christopher Devito on 4/29/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import XCTest
@testable import AnywhereFitness

class CourseControllerTests: XCTestCase {

    let courseController = CourseController.shared
    let userController = UserController.shared

    override func setUpWithError() throws {

    }

    func signInClient(completion: @escaping (Result<Bool, NetworkError>) -> Void) {
        let user = UserSignIn(username: "somethingNew",
                              password: "somethingNew",
                              role: Role.client.rawValue)
        let expectation = self.expectation(
            description: "Wait for sign in confirmation")
        userController.signIn(with: user, completion: { _ in
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10)
        completion(.success(true))
    }

    func signInInstructor(completion: @escaping (Result<Bool, NetworkError>) -> Void) {
        let user = UserSignIn(username: "someIns",
                              password: "someIns",
                              role: Role.instructor.rawValue)
        let expectation = self.expectation(
            description: "Wait for sign in confirmation")
        userController.signIn(with: user, completion: { _ in
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10)
        completion(.success(true))
    }

    func testFetchCourses() {
        let expectation = self.expectation(
        description: "Wait for fetchCourses")
        courseController.fetchCourses { result in
            guard let courses = try? result.get()
                else {
                    XCTFail("Unable to retrieve array of Courses from result")
                    return
            }
            XCTAssert(courses.count > 0)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }

    func testCreateCourse() {
        let newCourse: CourseRepresentation?
        newCourse = courseController.createCourse(name: "Advanced Yoga",
                                                  duration: 45.00, maxSize: 5,
                                                  classType: "Yoga",
                                                  instructor: "4")
        XCTAssert(newCourse != nil)
    }

    func testPostClass() {
        let newCourse: CourseRepresentation
        let startNumber = courseController.courses.count
        newCourse = courseController.createCourse(name: "Advanced Yoga2",
                                                  duration: 45.00, maxSize: 5,
                                                  classType: "Yoga",
                                                  instructor: "4")
        let expectation = self.expectation(description: "Waiting for postClass")
        let signInExpectation = self.expectation(description: "Waiting for signin")

        signInInstructor { (_) in
            signInExpectation.fulfill()
        }
        wait(for: [signInExpectation], timeout: 5)

        courseController.postClass(course: newCourse) { _ in
            XCTAssert(self.courseController.courses.count == (startNumber + 1))
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }

    func testPostClassNoAuth() {
        let newCourse: CourseRepresentation
        newCourse = courseController.createCourse(name: "Advanced Yoga2",
                                                  duration: 45.00, maxSize: 5,
                                                  classType: "Yoga",
                                                  instructor: "4")
        let expectation = self.expectation(description: "Waiting for postClass")

        courseController.postClass(course: newCourse) { result in
            XCTAssert(result == .failure(.noRep))
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }

    func testPostAttendee() {
        let courseID = 1
        let expectation = self.expectation(description: "Wait for postAttendee")
        let signInExpectation = self.expectation(description: "Wait for sign in")

        signInClient { (result) in
            print(result)
            signInExpectation.fulfill()
        }
        wait(for: [signInExpectation], timeout: 5)

        courseController.postAttendee(courseID: courseID) { (result) in
            XCTAssert(result == .success(true))
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }

    func testPostAttendeeNoAuth() {
        let courseID = 1
        let expectation = self.expectation(description: "Wait for postAttendee")

        courseController.postAttendee(courseID: courseID) { (result) in
            XCTAssert(result == .failure(.noRep))
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
}
