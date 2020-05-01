//
//  ClientHomeScreenViewController.swift
//  AnywhereFitness
//
//  Created by Christopher Devito on 4/29/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import UIKit

class ClientHomeScreenViewController: UIViewController {

    // MARK: - Properties
    let courseController = CourseController.shared

    // MARK: - IBOutlets
    @IBOutlet weak var backgroundView: UIView!

    // MARK: - View Lifecycle
    override func viewDidLoad() {
       super.viewDidLoad()
        updateViews()
    }

    func updateViews() {
        backgroundView.setBackgroundDark()
        courseController.fetchCourses { (result) in
            if let courses = try? result.get() {
                DispatchQueue.main.async {
                    self.courseController.allCourses = courses
                }
            }
        }
    }
}
