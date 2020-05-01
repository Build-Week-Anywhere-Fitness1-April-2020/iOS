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
    @IBOutlet weak var classEquipment: UITextView!
    @IBOutlet weak var classEndTime: UILabel!
    @IBOutlet weak var sundayButton: UIButton!
    @IBOutlet weak var mondayButton: UIButton!
    @IBOutlet weak var tuesdayButton: UIButton!
    @IBOutlet weak var wednesdayButton: UIButton!
    @IBOutlet weak var thursdayButton: UIButton!
    @IBOutlet weak var fridayButton: UIButton!
    @IBOutlet weak var saturdayButton: UIButton!

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        classStartTime.layer.borderWidth = 1
        classEquipment.layer.borderWidth = 1
        classCost.layer.borderWidth = 1
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
            guard let day = dayButtons[index].titleLabel?.text
                 else { return }
            course?.days.append(day)
        }

        guard let costString = classCost.text,
            !costString.isEmpty,
            let timeStartString = classStartTime.text,
            !timeStartString.isEmpty else { return }
        let cost = Double(costString)
        course?.cost = cost ?? 0.0
        course?.equipmentRequired = classEquipment.text
        course?.time = timeStartString
        performSegue(withIdentifier: "CreateClassThirdSegue", sender: self)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let page4VC = segue.destination as? Page4CreateCourseViewController else { return }
        page4VC.course = course
        page4VC.courseController = courseController
    }
}
