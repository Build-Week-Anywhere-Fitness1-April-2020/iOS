//
//  LoginViewController.swift
//  AnywhereFitness
//
//  Created by Mark Poggi on 4/27/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import UIKit

enum LoginType {
    case signUp
    case signIn
}

class LoginViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!

    // MARK: - Properties
    var userController = UserController()
    var loginType = LoginType.signUp
    var role: Role?

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard let username = usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
            username.isEmpty == false,
            let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
            password.isEmpty == false,
            let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
            email.isEmpty == false,
            let name = nameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
            name.isEmpty == false
            else { return }
        let user = UserLogin(username: username, email: email, password: password, roles: [role.rawValue])

        if loginType == .signUp {
            userController.signUp(with: user) { (error) in

                if let error = error {
                    NSLog("Error occurred during sign up: \(error)")
                } else {
                    DispatchQueue.main.async {
                        let alertController = UIAlertController(title: "Sign Up Successful",
                                                                message: "Now please log in", preferredStyle: .alert)
                        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                        alertController.addAction(alertAction)
                        self.present(alertController, animated: true, completion: {
                            self.loginType = .signIn
                        })
                        UserDefaults.standard.set("token", forKey: "bearerToken")
                    }
                }
            }
        } else {
            userController.signIn(with: user) { (error) in
                if let error = error {
                    print(error)
                }

                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
}
private func alert(title: String, message: String) -> UIAlertController {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default))
    return alert
}
