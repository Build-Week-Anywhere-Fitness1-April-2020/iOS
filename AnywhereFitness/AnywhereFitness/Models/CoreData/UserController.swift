//
//  UserController.swift
//  AnywhereFitness
//
//  Created by Mark Poggi on 4/27/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import Foundation
import CoreData

class UserController {

    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }

    enum NetworkError: Error {
        case failedSignUp, failedSignIn, noData, badData
        case notSignedIn, failedFetch, badURL
    }

    // MARK: - Propertiesa
    var courses: [Course] = []
    var bearer: Bearer?

    private let baseURL = URL(string: "https://anywherefitness-api.herokuapp.com/")!
    private lazy var signUpURL = baseURL.appendingPathComponent("auth/register")
    private lazy var signInURL = baseURL.appendingPathComponent("/auth/login")

    private lazy var jsonEncoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return encoder
    }()

    private lazy var jsonDecoder = JSONDecoder()

    // MARK: - Methods
    func signUp(with user: UserLogin, completion: @escaping (Error?)-> Void) {
        let signUpURL = baseURL.appendingPathComponent("auth/register")

        var request = URLRequest(url: signUpURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let jsonEncoder = JSONEncoder()

        do {
            let jsonData = try jsonEncoder.encode(user)
            request.httpBody = jsonData
        } catch {
            NSLog("Error encoding user object: \(error)")
            completion(error)
            return
        }

        URLSession.shared.dataTask(with: request) { (_, response, error) in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 201 {
                completion(NSError(domain: "", code: response.statusCode, userInfo: nil))
                return
            }

            if let error = error {
                completion(error)
                return
            }
            completion(nil)
            print("passed sign in")
        }.resume()
    }

    func signIn(with user: UserLogin, completion: @escaping (Error?) -> Void) {
        let signInURL = baseURL.appendingPathComponent("auth/login")

        var request = URLRequest(url: signInURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let jsonEncoder = JSONEncoder()

        do {
            let jsonData = try jsonEncoder.encode(user)
            request.httpBody = jsonData
        } catch {
            NSLog("Error encoding user object: \(error)")
            completion(error)
            return
        }

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                completion(NSError(domain: "", code: response.statusCode, userInfo: nil))
                return
            }

            if let error = error {
                completion(error)
                return
            }

            guard let data = data else {
                completion(error)
                return
            }

            let jsonDecoder = JSONDecoder()

            do {
                let bearer = try jsonDecoder.decode(Bearer.self, from: data)
                self.bearer = bearer

                print(self.bearer!)

                completion(nil)

            } catch {
                NSLog("Error decoding bearer object: \(error)")
                completion(error)
                return
            }
        }.resume()
    }

}
