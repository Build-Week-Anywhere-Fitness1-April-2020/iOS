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
    private let apiKey = ""
    private let baseURL = URL(string: "https://anywherefitness-api.herokuapp.com/")!
}
