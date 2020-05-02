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
        classArrive.layer.borderWidth = 1
        additionalInfo.layer.borderWidth = 1
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }

    @IBAction func finishButtonTapped(_ sender: Any) {
        guard let classArrive = classArrive.text,
            !classArrive.isEmpty,
            let additionalInfo = additionalInfo.text,
            !additionalInfo.isEmpty,
            var course = course else { return }

        course.arrivalDescription = classArrive
        course.additionalInfo = additionalInfo

        courseController?.postClass(course: course) //, completion: { (result) in
//            if result == .success(true) {
            self.performSegue(withIdentifier: "CreateClassLastSegue", sender: self)
//            } else {
//                print("\(result)")
//                print("\(course)")
//            }
//        })
    }
}
