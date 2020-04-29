//
//  Page1CreateCourseViewController.swift
//  AnywhereFitness
//
//  Created by Mark Poggi on 4/28/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import UIKit

class Page1CreateCourseViewController: UIViewController {

    var course: CourseRepresentation?
    let courseController = CourseController()
    let classTypeArray: [[String]] = [["Class Type"], ["Yoga", "Weightlifting", "Crossfit"]]

    @IBOutlet weak var classTypeUIPicker: UIPickerView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var className: UITextField!
    @IBOutlet weak var classSize: UITextField!
    @IBOutlet weak var classLength: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        classTypeUIPicker.dataSource = self
        classTypeUIPicker.delegate = self
    }

     // MARK: - Navigation

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let page2VC = segue.destination as? Page2CreateCourseViewController else { return }
        page2VC.course = course
        page2VC.courseController = courseController
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

        let classType = classTypeUIPicker.selectedRow(inComponent: 0)

        course = courseController.createCourse(name: className,
                                               duration: duration,
                                               maxSize: maxSize,
                                               classType: classTypeArray[0][classType])
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
