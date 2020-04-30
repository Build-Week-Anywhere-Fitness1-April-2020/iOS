//
//  Page4CreateCourseViewController.swift
//  AnywhereFitness
//
//  Created by Christopher Devito on 4/28/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import UIKit

class Page4CreateCourseViewController: UIViewController {

    // MARK: - Properties
    var course: CourseRepresentation?
    var courseController: CourseController?

    // MARK: - IBOutlets
    @IBOutlet weak var classAddress: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let page5VC = segue.destination as? Page5CreateCourseViewController else { return }
        page5VC.course = course
        page5VC.courseController = courseController
    }

    @IBAction func nextButtonTapped(_ sender: Any) {
        guard let classAddress = classAddress.text,
            !classAddress.isEmpty,
            let city = cityTextField.text,
            !city.isEmpty,
            let state = stateTextField.text,
            !state.isEmpty,
            let zipCode = zipCodeTextField.text,
            !zipCode.isEmpty
            else { return }
        let location = "\(city), \(state) \(zipCode)"
        let address = "\(classAddress), \(location)"
        course?.location = location
        course?.address = address
        performSegue(withIdentifier: "CreateClassFourthSegue", sender: self)
    }
}
