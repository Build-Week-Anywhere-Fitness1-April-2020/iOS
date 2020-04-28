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

    // MARK: - IBOutlets
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var signinLabel: UILabel!

    // MARK: - IBActions
    @IBAction func clientSignup(_ sender: Any) {
        if UserDefaults.standard.value(forKey: "bearerToken") != nil {
            performSegue(withIdentifier: "SignedInClientSegue", sender: self)
        } else {
            performSegue(withIdentifier: "SignUpClientSegue", sender: self)
            let loginVC = LoginViewController()
            loginVC.role = Role.client
        }
    }

    @IBAction func instructorSignup(_ sender: Any) {
        if UserDefaults.standard.value(forKey: "bearerToken") != nil {
            performSegue(withIdentifier: "SignedInInstructorSegue", sender: self)
        } else {
            performSegue(withIdentifier: "SignUpInstructorSegue", sender: self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if UserDefaults.standard.value(forKey: "bearerToken") != nil {
            signinLabel.text = "Sign In"
        } else {
            signinLabel.text = "Sign Up"
        }

        backgroundView.setBackground()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SignUpClientSegue" {
            if let loginVC = segue.destination as? LoginViewController {
                loginVC.role = Role.client
            }
        } else if segue.identifier == "SignUpInstructorSegue" {
            guard let loginVC = segue.destination as? LoginViewController else { return }
            loginVC.role = Role.instructor
        }
    }

}
