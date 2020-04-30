//
//  SearchReserveViewController.swift
//  AnywhereFitness
//
//  Created by Christopher Devito on 4/29/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import UIKit

class SearchReserveViewController: UIViewController {

    // MARK: - Properties
    var course: CourseRepresentation?
    var day: String?
    let courseController = CourseController()

    // MARK: - IBOutlets
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var classTitleLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var whenToArriveLabel: UILabel!
    @IBOutlet weak var additionalInfoLabel: UILabel!

    // MARK: - IBActions
    @IBAction func reserveButtonTapped(_ sender: Any) {
        guard let courseID = course?.identifier else { return }
        courseController.postAttendee(courseID: courseID) { _ in
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "SearchSegue5", sender: self)
            }
        }
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
        addressLabel.text = course.address
        whenToArriveLabel.text = course.arrivalDescription
        additionalInfoLabel.text = course.additionalInfo
        if course.classType == "Yoga" {
            backgroundView.setBackground(toImageNamed: "YogaImage")
        } else if course.classType == "Weightlifting" {
            backgroundView.setBackground(toImageNamed: "WeightliftingImage")
        } else if course.classType == "Crossfit" {
            backgroundView.setBackground(toImageNamed: "BoxingImage")
        } else {
            backgroundView.setBackground()
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SearchSegue5" {
            guard let searchConfirmVC = segue.destination as? SearchConfirmationViewController else { return }
            searchConfirmVC.course = course
            searchConfirmVC.day = day
        }
    }

}
