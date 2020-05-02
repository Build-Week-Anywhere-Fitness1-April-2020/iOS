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
    @IBOutlet weak var signupLabel: UILabel!

    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    // MARK: - Properties
    var userController = UserController()
    var loginType: LoginType?
    var role: Role?
    lazy var successTitle: String = {
        if let loginType = self.loginType {
            let message = loginType == LoginType.signIn ? "Sign In" : "Sign Up"
            let success = "\(message) Successful"
            return success
        }
        return " "
    }()
    lazy var failureTitle: String = {
        if let loginType = self.loginType {
            let message = loginType == LoginType.signIn ? "Sign In" : "Sign Up"
            let success = "\(message) Failed"
            return success
        }
        return " "
    }()
    lazy var successMessage: String = {
        if let loginType = self.loginType {
            let message = loginType == LoginType.signUp ? "Now please log in" : "Lets go work out!"
            return message
        }
        return " "
    }()
    lazy var failureMessage: String = "Please try again later."

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if loginType == LoginType.signIn {
            emailTextField.isHidden = true
            nameTextField.isHidden = true
            nameLabel.isHidden = true
            emailLabel.isHidden = true
            signupLabel.text = "Sign In"
            emailTextField.layer.borderWidth = 1
            nameTextField.layer.borderWidth = 1
            let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
            view.addGestureRecognizer(tap)
        }
    }

    // MARK: - Actions
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard let username = usernameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
            username.isEmpty == false,
            let password = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
            password.isEmpty == false, let role = role
            else { return }

        if loginType == .signUp {
            guard let email = emailTextField.text,
            email.isEmpty == false,
            let name = nameTextField.text,
                name.isEmpty == false else { return }
            UserDefaults.standard.set("\(name)", forKey: UserDefaultKeys.user.rawValue)
            let user = UserLogin(username: username, email: email, password: password,
                                 gender: Gender.male.rawValue, displayName: name, roles: [role.rawValue])

            userController.signUp(with: user) { (error) in

                if let error = error {
                    NSLog("Error occurred during sign up: \(error)")
                    self.presentAlert(title: self.failureTitle,
                                      message: self.failureMessage, success: false)
                } else {
                    DispatchQueue.main.async {
                        UserDefaults.standard.set("token", forKey: "bearerToken")
                        self.presentAlert(title: self.successTitle,
                                          message: self.successMessage, success: true)
                    }
                }
            }
        } else {
            let user = UserSignIn(username: username, password: password, role: role.rawValue)
            userController.signIn(with: user) { (error) in
                if let error = error {
                    DispatchQueue.main.async {
                        self.presentAlert(title: self.failureTitle,
                                          message: self.failureMessage, success: false)
                    }
                    print(error)
                    return
                }

                DispatchQueue.main.async {
                    self.presentAlert(title: self.successTitle,
                                      message: self.successMessage, success: true)
                }
            }
        }
    }

    func presentAlert(title: String, message: String, success: Bool) {
        let alertController = UIAlertController(title: title,
                                                message: message, preferredStyle: .alert)
        let alertActionFailure = UIAlertAction(title: "OK", style: .default, handler: nil)
        let alertActionSuccess = UIAlertAction(title: "OK", style: .default) { _ in
            if self.loginType == LoginType.signIn {
                self.performSegue(withIdentifier: (self.role == Role.client) ? "ClientSegue" : "InstructorSegue",
                sender: self)
            } else {
                self.dismiss(animated: true, completion: nil)
            }
        }
        if success {
            alertController.addAction(alertActionSuccess)
        } else {
            alertController.addAction(alertActionFailure)
        }
        self.present(alertController, animated: true, completion: {
            if self.loginType == LoginType.signUp {
                self.loginType = .signIn
            }
        })
    }
}
