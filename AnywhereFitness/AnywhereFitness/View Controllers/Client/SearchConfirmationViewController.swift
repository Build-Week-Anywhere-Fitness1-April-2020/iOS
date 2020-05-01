//
//  SearchConfirmationViewController.swift
//  AnywhereFitness
//
//  Created by Christopher Devito on 4/29/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import UIKit

class SearchConfirmationViewController: UIViewController {

    // MARK: - Properties
    var course: CourseRepresentation?
    var day: String?

    // MARK: - IBOutlets
    @IBOutlet weak var classTitleLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!

    // MARK: - IBActions
    @IBAction func doneButtonTapped(_ sender: Any) {
        //tabBarController?.selectedIndex = 0
    }

    @IBAction func addAnotherClassButtonTapped(_ sender: Any) {
        //self.navigationController?.popToRootViewController(animated: true)
    }

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    func updateViews() {
        guard let course = course else { return }
        classTitleLabel.text = course.name
        dayLabel.text = day
        timeLabel.text = course.time
        if course.classType == 0 {
            backgroundView.setBackground(toImageNamed: "YogaImage")
        } else if course.classType == 1 {
            backgroundView.setBackground(toImageNamed: "WeightliftingImage")
        } else if course.classType == 2 {
            backgroundView.setBackground(toImageNamed: "BoxingImage")
        } else if course.classType == 3 {
            backgroundView.setBackground(toImageNamed: "PilatesImage")
        } else {
            backgroundView.setBackground()
        }
    }
}
