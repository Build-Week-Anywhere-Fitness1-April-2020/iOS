//
//  Page5CreateCourseViewController.swift
//  AnywhereFitness
//
//  Created by Christopher Devito on 4/28/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import UIKit

class Page5CreateCourseViewController: UIViewController {

    // MARK: - Properties
    var course: CourseRepresentation?
    var courseController: CourseController?

    @IBOutlet weak var classArrive: UITextView!
    @IBOutlet weak var additionalInfo: UITextView!

    // MARK: - IBOutlets
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func finishButtonTapped(_ sender: Any) {
        guard let classArrive = classArrive.text,
            !classArrive.isEmpty,
            let additionalInfo = additionalInfo.text,
            !additionalInfo.isEmpty,
            var course = course else { return }

        course.arrivalDescription = classArrive
        course.additionalInfo = additionalInfo

        courseController?.postClass(course: course)
        performSegue(withIdentifier: "CreateClassLastSegue", sender: self)
    }
}
