//
//  InstructorHomeScreenViewController.swift
//  AnywhereFitness
//
//  Created by Christopher Devito on 4/28/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import UIKit

/// View Controller to display landing screen for Instructor
class InstructorHomeScreenViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.setBackgroundDark()
    }
}
