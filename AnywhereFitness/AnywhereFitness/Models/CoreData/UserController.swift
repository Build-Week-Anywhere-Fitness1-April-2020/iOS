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

    // MARK: - Properties
    var courses: [Course] = []
    var bearer: Bearer?
    static let shared = UserController()

    private let baseURL = URL(string: "https://anywherefitness-api.herokuapp.com/")!
    private lazy var signUpURL = baseURL.appendingPathComponent("auth/register")
    private lazy var signInURL = baseURL.appendingPathComponent("auth/login")

    private lazy var jsonEncoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return encoder
    }()

    private lazy var jsonDecoder = JSONDecoder()

    // MARK: - Methods
    func signUp(with user: UserLogin, completion: @escaping (Error?) -> Void) {

        var request = URLRequest(url: signUpURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

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

    func signIn(with user: UserSignIn, completion: @escaping (Error?) -> Void) {

        var request = URLRequest(url: signInURL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

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
                response.statusCode != 201 {
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

            struct UserIdentifier: Decodable {
                let user: Identifier

                struct Identifier: Decodable {
                    let identifier: Int

                    enum CodingKeys: String, CodingKey {
                        case identifier = "id"

                    }
                }
            }

            do {
                let bearer = try self.jsonDecoder.decode(Bearer.self, from: data)
                let identification = try self.jsonDecoder.decode(UserIdentifier.self, from: data)
                UserController.shared.bearer = bearer
                let identifier = identification.user.identifier
                UserDefaults.standard.set(identifier, forKey: "userID")

                completion(nil)

            } catch {
                NSLog("Error decoding bearer object: \(error)")
                completion(error)
                return
            }
        }.resume()
    }
}
