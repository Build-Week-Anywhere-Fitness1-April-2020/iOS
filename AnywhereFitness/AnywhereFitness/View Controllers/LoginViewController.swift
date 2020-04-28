//
//  LoginViewController.swift
//  AnywhereFitness
//
//  Created by Mark Poggi on 4/27/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import UIKit

enum LoginType: String {
    case signUp = "Sign Up"
    case signIn = "Sign In"
}

class LoginViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!

    // MARK: - Properties
    var loginController = LoginController()

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()    }

    // MARK: - Actions
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard let username = usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
            username.isEmpty == false,
            let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
            password.isEmpty == false,
            let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
            email.isEmpty == false
            else { return }

        let user = UserLogin(username: username, password: password, email: email)

//        LoginController.signUp(with )
//
//        (with: user, forLoginType: loginType) { loginResult in
//            DispatchQueue.main.async {
//                self.isFetching = false
//                let alert: UIAlertController
//                let action: () -> Void
//
//                switch loginResult {
//                case .signUpSuccess:
//                    alert = self.alert(title: "Success", message: loginResult.rawValue)
//                    action = {
//                        self.present(alert, animated: true)
//                        self.loginTypeSegmentedControl.selectedSegmentIndex = 1
//                        self.loginTypeSegmentedControl.sendActions(for: .valueChanged)
//                    }
//                case .signInSuccess:
//                    action = { self.dismiss(animated: true) }
//                case .signUpError, .signInError:
//                    alert = self.alert(title: "Error", message: loginResult.rawValue)
//                    action = { self.present(alert, animated: true) }
//                }
//
//                action()
//            }
//        }
    }

    private func alert(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        return alert
    }
}
