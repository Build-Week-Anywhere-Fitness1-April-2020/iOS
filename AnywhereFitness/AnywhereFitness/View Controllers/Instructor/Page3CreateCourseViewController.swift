//
//  Page3CreateCourseViewController.swift
//  AnywhereFitness
//
//  Created by Christopher Devito on 4/28/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import UIKit

class Page3CreateCourseViewController: UIViewController {

    // MARK: - Properties
    var course: CourseRepresentation?
    var courseController: CourseController?
    var sunday: Bool = false
    var monday: Bool = false
    var tuesday: Bool = false
    var wednesday: Bool = false
    var thursday: Bool = false
    var friday: Bool = false
    var saturday: Bool = false
    lazy var days: [Bool] = {
        var temp: [Bool] = [sunday, monday, tuesday, wednesday, thursday, friday, saturday]
        return temp
    }()
    lazy var dayButtons: [UIButton] = {
        var temp: [UIButton] = [sundayButton, mondayButton, tuesdayButton,
                                wednesdayButton, thursdayButton, fridayButton, saturdayButton]
        return temp
    }()

    // MARK: - IBOutlets
    @IBOutlet weak var classCost: UITextField!
    @IBOutlet weak var classStartTime: UITextField!
    @IBOutlet weak var classEndTime: UILabel!
    @IBOutlet weak var sundayButton: UIButton!
    @IBOutlet weak var mondayButton: UIButton!
    @IBOutlet weak var tuesdayButton: UIButton!
    @IBOutlet weak var wednesdayButton: UIButton!
    @IBOutlet weak var thursdayButton: UIButton!
    @IBOutlet weak var fridayButton: UIButton!
    @IBOutlet weak var saturdayButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - IBAction
    @IBAction func sundayButtonTapped(_ sender: Any) {
        sunday.toggle()
        sundayButton.backgroundColor = sunday ? .systemOrange : .systemGray
    }

    @IBAction func mondayButtonTapped(_ sender: Any) {
        monday.toggle()
        mondayButton.backgroundColor = monday ? .systemOrange : .systemGray
    }

    @IBAction func tuesdayButtonTapped(_ sender: Any) {
        tuesday.toggle()
        tuesdayButton.backgroundColor = tuesday ? .systemOrange : .systemGray
    }

    @IBAction func wednesdayButtonTapped(_ sender: Any) {
        wednesday.toggle()
        wednesdayButton.backgroundColor = wednesday ? .systemOrange : .systemGray
    }

    @IBAction func thursdayButtonTapped(_ sender: Any) {
        thursday.toggle()
        thursdayButton.backgroundColor = thursday ? .systemOrange : .systemGray
    }

    @IBAction func fridayButtonTapped(_ sender: Any) {
        friday.toggle()
        fridayButton.backgroundColor = friday ? .systemOrange : .systemGray
    }

    @IBAction func saturdayButtonTapped(_ sender: Any) {
        saturday.toggle()
        saturdayButton.backgroundColor = saturday ? .systemOrange : .systemGray
    }

    @IBAction func nextButtonTapped(_ sender: Any) {
        for index in 0..<dayButtons.count where days[index] {
            guard let day = dayButtons[index].titleLabel?.text else { return }
            course?.days.append(day)
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       guard let page3VC = segue.destination as? Page3CreateCourseViewController else { return }
       page3VC.course = course
       page3VC.courseController = courseController
    }

}
