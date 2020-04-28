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

    // MARK: - Properties
    static var bearer: Bearer?
    private let apiKey = ""
    private let baseURL = URL(string: "https://anywherefitness-api.herokuapp.com/")!
    private lazy var signUpURL = baseURL.appendingPathComponent("auth/register")
    private lazy var signInURL = baseURL.appendingPathComponent("/auth/login")
    private lazy var jsonEncoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return encoder
    }()
    private lazy var jsonDecoder = JSONDecoder()

    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
    }

    enum NetworkError: Error {
        case failedSignUp, failedSignIn, noData, badData
        case notSignedIn, failedFetch, badURL
    }

    private enum LoginStatus {
        case notLoggedIn
        case loggedIn(Bearer)

        static var isLoggedIn: Self {
            if let bearer = UserController.bearer {
                return loggedIn(bearer)
            } else {
                return notLoggedIn
            }
        }
    }

    // MARK: - Methods


    func signUp(with user: User, completion: @escaping (Result<Bool, NetworkError>) -> Void) {
        var request = postRequest(for: signUpURL)

        do {
            let jsonData = try jsonEncoder.encode(user)
            print(String(data: jsonData, encoding: .utf8)!)
            request.httpBody = jsonData

            URLSession.shared.dataTask(with: request) { _, response, error in
                if let error = error {
                    print("Sign up failed with error: \(error.localizedDescription)")
                    completion(.failure(.failedSignUp))
                    return
                }

                guard let response = response as? HTTPURLResponse,
                    response.statusCode == 200
                    else {
                        print("Sign up was unsuccessful")
                        return completion(.failure(.failedSignUp))
                }

                completion(.success(true))
            }
            .resume()
        } catch {
            print("Error encoding user: \(error.localizedDescription)")
            completion(.failure(.failedSignUp))
        }
    }

    func signIn(with user: User, completion: @escaping (Result<Bool, NetworkError>) -> Void) {
        var request = postRequest(for: signInURL)

        do {
            let jsonData = try jsonEncoder.encode(user)
            request.httpBody = jsonData

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Sign in failed with error: \(error.localizedDescription)")
                    completion(.failure(.failedSignIn))
                    return
                }

                guard let response = response as? HTTPURLResponse,
                    response.statusCode == 200
                    else {
                        print("Sign in was unsuccessful")
                        return completion(.failure(.failedSignIn))
                }

                guard let data = data else {
                    print("Data was not received")
                    completion(.failure(.noData))
                    return
                }
                do {
                    Self.bearer = try self.jsonDecoder.decode(Bearer.self, from: data)
                    completion(.success(true))
                } catch {
                    print("Error decoding bearer: \(error.localizedDescription)")
                    completion(.failure(.failedSignIn))
                }
            }
            .resume()
        } catch {
            print("Error encoding user: \(error.localizedDescription)")
            completion(.failure(.failedSignIn))
        }
    }

    private func postRequest(for url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }

    private func getRequest(for url: URL, bearer: Bearer) -> URLRequest {
        var request = URLRequest(url: url)
        request.addValue("Bearer \(bearer.token)", forHTTPHeaderField: "Authorization")
        return request
    }

}
