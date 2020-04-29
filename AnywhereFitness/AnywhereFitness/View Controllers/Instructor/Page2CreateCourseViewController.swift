//
//  Page2CreateCourseViewController.swift
//  AnywhereFitness
//
//  Created by Christopher Devito on 4/28/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import UIKit

class Page2CreateCourseViewController: UIViewController {

    // MARK: - Properties
    var course: CourseRepresentation?
    var courseController: CourseController?
    let courseIntensityArray: [[String]] = [["Class Level"], ["Beginner", "Intermediate", "Advanced"]]

    // MARK: - IBOutlets
    @IBOutlet weak var courseDescriptions: UITextView!
    @IBOutlet weak var courseLevel: UIPickerView!
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - IBActions
    @IBAction func nextButtonTapped(_ sender: Any) {
        guard let courseDescription = courseDescriptions.text,
            !courseDescription.isEmpty else { return }

        let courseIntensity = courseLevel.selectedRow(inComponent: 0)

        course?.courseDescription = courseDescription
        course?.intensity = courseIntensityArray[1][courseIntensity]

        performSegue(withIdentifier: "CreateClassSecondSegue", sender: self)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       guard let page3VC = segue.destination as? Page3CreateCourseViewController else { return }
       page3VC.course = course
       page3VC.courseController = courseController
    }

}
