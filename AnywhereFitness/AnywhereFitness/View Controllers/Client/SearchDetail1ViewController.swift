//
//  SearchDetail1ViewController.swift
//  AnywhereFitness
//
//  Created by Christopher Devito on 4/29/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import UIKit

class SearchDetail1ViewController: UIViewController {

    // MARK: - Properties
    var course: CourseRepresentation?
    var formatter: NumberFormatter =  {
        let formatter = NumberFormatter()
        formatter.alwaysShowsDecimalSeparator = true
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.currencyGroupingSeparator = ","
        formatter.currencySymbol = "$"
        formatter.maximumFractionDigits = 2
        return formatter
    }()

    // MARK: - IBOutlets
    @IBOutlet weak var classTitleLabel: UILabel!
    @IBOutlet weak var aboutClassLabel: UILabel!
    @IBOutlet weak var equipmentLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var backgroundView: UIView!

    // MARK: - IBActions
    @IBAction func viewScheduleTapped(_ sender: Any) {
        performSegue(withIdentifier: "SearchSegue3", sender: self)
    }

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    func updateViews() {
        guard let course = course else { return }
        classTitleLabel.text = course.name
        aboutClassLabel.text = course.courseDescription
        equipmentLabel.text = course.equipmentRequired
        costLabel.text = formatter.string(from: NSNumber(value: course.cost))
        if course.classType == "Yoga" {
            backgroundView.setBackground(toImageNamed: "YogaImage")
        } else if course.classType == "Weightlifting" {
            backgroundView.setBackground(toImageNamed: "WeightliftingImage")
        } else if course.classType == "Crossfit" {
            backgroundView.setBackground(toImageNamed: "BoxingImage")
        } else if course.classType == "Pilates" {
            backgroundView.setBackground(toImageNamed: "PilatesImage")
        } else {
            backgroundView.setBackground()
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SearchSegue3" {
            guard let searchScheduleVC = segue.destination as? SearchScheduleViewController else { return }
            searchScheduleVC.course = course
        }
    }
}
