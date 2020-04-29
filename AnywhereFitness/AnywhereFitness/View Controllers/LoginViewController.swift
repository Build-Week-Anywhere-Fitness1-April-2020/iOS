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
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!

    // MARK: - Properties
    var userController = UserController()
    var loginType: LoginType?
    var role: Role?

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if loginType == LoginType.signIn {
            emailTextField.isHidden = true
            nameTextField.isHidden = true
            nameLabel.isHidden = true
            emailLabel.isHidden = true
        }
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
            name.isEmpty == false,
            let role = role
            else { return }
        let user = UserLogin(username: username, email: email, password: password, roles: [role.rawValue])
        UserDefaults.standard.set("\(name)", forKey: UserDefaultKeys.user.rawValue)

        if loginType == .signUp {
            userController.signUp(with: user) { (error) in

                if let error = error {
                    NSLog("Error occurred during sign up: \(error)")
                } else {
                    DispatchQueue.main.async {
                        let alertController = UIAlertController(title: "Sign Up Successful",
                                                                message: "Now please log in", preferredStyle: .alert)
                        let alertAction = UIAlertAction(title: "OK", style: .default) { _ in
                            if role == Role.client {
                                self.performSegue(withIdentifier: "ClientSegue", sender: self)
                            } else {
                                self.performSegue(withIdentifier: "InstructorSegue", sender: self)
                            }
                        }
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
