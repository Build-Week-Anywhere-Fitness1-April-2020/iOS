//
//  LandingScreenViewController.swift
//  AnywhereFitness
//
//  Created by Christopher Devito on 4/28/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import UIKit

class LandingScreenViewController: UIViewController {

    // MARK: - Properties
    var role: [Role]?

    // MARK: - IBOutlets
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var signinLabel: UILabel!

    // MARK: - IBActions
    @IBAction func clientSignup(_ sender: Any) {
        role = [Role.client]
        if UserDefaults.standard.value(forKey: "bearerToken") != nil {
            performSegue(withIdentifier: "SignInSegue", sender: self)
        } else {
            performSegue(withIdentifier: "SignUpSegue", sender: self)
        }
    }

    @IBAction func instructorSignup(_ sender: Any) {
        role = [Role.instructor]
        if UserDefaults.standard.value(forKey: "bearerToken") != nil {
            performSegue(withIdentifier: "SignInSegue", sender: self)
        } else {
            performSegue(withIdentifier: "SignUpSegue", sender: self)
        }
    }

    @IBAction func unwindSegue(unwindSegue: UIStoryboardSegue) {

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if UserDefaults.standard.value(forKey: "bearerToken") != nil {
            signinLabel.text = "Sign In"
        } else {
            signinLabel.text = "Sign Up"
        }

        backgroundView.setBackgroundDark()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SignUpSegue" {
            guard let signUpVC = segue.destination as? LoginViewController,
                let role = role else { return }
            signUpVC.role = role[0]
            signUpVC.loginType = .signUp
        } else if segue.identifier == "SignInSegue" {
            guard let loginVC = segue.destination as? LoginViewController,
                let role = role else { return }
            loginVC.role = role[0]
            loginVC.loginType = .signIn
        }
    }
}
