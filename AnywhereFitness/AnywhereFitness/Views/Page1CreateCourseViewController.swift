//
//  Page1CreateCourseViewController.swift
//  AnywhereFitness
//
//  Created by Mark Poggi on 4/28/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import UIKit

class Page1CreateCourseViewController: UIViewController {

    // MARK: - Properties
    var course: CourseRepresentation?
    let courseController = CourseController.shared
    var classTypeArray = CourseController.shared.classTypeArray

    // MARK: - IBOutlets
    @IBOutlet weak var classTypeUIPicker: UIPickerView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var className: UITextField!
    @IBOutlet weak var classSize: UITextField!
    @IBOutlet weak var classLength: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        classTypeArray = courseController.classTypeArray
        classTypeUIPicker.dataSource = self
        classTypeUIPicker.delegate = self
    }

     // MARK: - Navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let page2VC = segue.destination as? Page2CreateCourseViewController else { return }
        page2VC.course = course
     }

    @IBAction func unwindAndClear(unwindSegue: UIStoryboardSegue) {
        className.text = ""
        classSize.text = ""
        classLength.text = ""
        classTypeUIPicker.selectRow(0, inComponent: 1, animated: true)
    }

    @IBAction func unwindAndTab(unwindSegue: UIStoryboardSegue) {
        className.text = ""
        classSize.text = ""
        classLength.text = ""
        classTypeUIPicker.selectRow(0, inComponent: 1, animated: true)
        tabBarController?.selectedIndex = 0
    }

    @IBAction func nextButtonTapped(_ sender: Any) {
        guard let className = className.text,
            !className.isEmpty,
            let durationString = classLength.text,
            !durationString.isEmpty,
            let duration = Double(durationString),
            let maxSizeString = classSize.text,
            !maxSizeString.isEmpty,
            let maxSize = Int(maxSizeString) else { return }

        let classType = classTypeUIPicker.selectedRow(inComponent: 1)
        let userValue = UserDefaults.standard.value(forKey: UserDefaultKeys.user.rawValue)
        guard let instructorName: String = userValue as? String else { return }

        course = courseController.createCourse(name: className,
                                               duration: duration,
                                               maxSize: maxSize,
                                               classType: classTypeArray[1][classType], instructor: instructorName)
        performSegue(withIdentifier: "CreateClassFirstSegue", sender: self)
    }
}

extension Page1CreateCourseViewController: UIPickerViewDataSource, UIPickerViewDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        classTypeArray.count
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        classTypeArray[component].count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return classTypeArray[component][row]
    }
}
