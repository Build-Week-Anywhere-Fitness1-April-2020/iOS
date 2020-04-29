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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       guard let page3VC = segue.destination as? Page3CreateCourseViewController else { return }
       page3VC.course = course
       page3VC.courseController = courseController
    }

}
