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
    let classTypeArray = [["Yoga", "Weightlifting", "Crossfit"]]

    @IBOutlet weak var classTypeUIPicker: UIPickerView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var className: UITextField!
    @IBOutlet weak var classSize: UITextField!
    @IBOutlet weak var classLength: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.isEnabled = false

    }
    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func nextButtonTapped(_ sender: Any) {
        guard let className = className.text,
            let durationString = classLength.text,
            let duration = Double(durationString),
            let maxSizeString = classSize.text,
            let maxSize = Int(maxSizeString) else { return }

        let classType = classTypeUIPicker.selectedRow(inComponent: 0)

        course = courseController.createCourse(name: className, duration: duration, maxSize: maxSize, classType: classTypeArray[0][classType])
    }

}
extension Page1CreateCourseViewController: UIPickerViewDataSource, UIPickerViewDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        classTypeArray[component].count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return classTypeArray[component][row]
    }
}
