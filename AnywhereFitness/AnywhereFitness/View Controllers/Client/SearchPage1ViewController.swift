//
//  SearchPage1ViewController.swift
//  AnywhereFitness
//
//  Created by Christopher Devito on 4/29/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import UIKit

class SearchPage1ViewController: UIViewController {

    // MARK: - Properties
    var course: CourseRepresentation?
    let courseController = CourseController.shared
    var courseLevelArray = CourseController.shared.courseIntensityArray
    var classTypeArray = CourseController.shared.classTypeArray
    var searchResults: [CourseRepresentation] = []
    var mySearchResults: [CourseRepresentation] = []

    // MARK: - IBOutlets
    @IBOutlet weak var classTypeUIPicker: UIPickerView!
    @IBOutlet weak var courseLevel: UIPickerView!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet var backgroundView: UIView!

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        courseLevel.dataSource = self
        courseLevel.delegate = self
        classTypeUIPicker.dataSource = self
        classTypeUIPicker.delegate = self
        locationTextField.layer.borderWidth = 1
        backgroundView.setBackground()
    }

    // MARK: - IBActions
    @IBAction func searchButtonTapped(_ sender: Any) {
        let classType = classTypeUIPicker.selectedRow(inComponent: 1)
        let courseIntensity = courseLevel.selectedRow(inComponent: 1)
        let myLevel = courseLevelArray[1][courseIntensity]
        let myLocation = locationTextField.text
        searchResults = courseController.allCourses
        mySearchResults = searchResults.filter { $0.classType == classType
            && $0.intensity == myLevel
            && $0.location == myLocation }
        print(mySearchResults)
        performSegue(withIdentifier: "SearchSegue1", sender: self)
    }

    @IBAction func unwindAndClear(unwindSegue: UIStoryboardSegue) {
        locationTextField.text = ""
        classTypeUIPicker.selectRow(0, inComponent: 1, animated: true)
        courseLevel.selectRow(0, inComponent: 1, animated: true)
    }

    @IBAction func unwindAndTab(unwindSegue: UIStoryboardSegue) {
        locationTextField.text = ""
        classTypeUIPicker.selectRow(0, inComponent: 1, animated: true)
        courseLevel.selectRow(0, inComponent: 1, animated: true)
        tabBarController?.selectedIndex = 0
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SearchSegue1" {
            guard let page2VC = segue.destination as? SearchResultsViewController else { return }
            page2VC.courses = mySearchResults
        }
    }
}

extension SearchPage1ViewController: UIPickerViewDataSource, UIPickerViewDelegate {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView.tag == 0 {
            return classTypeArray.count
        } else {
            return courseLevelArray.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return classTypeArray[component].count
        } else {
            return courseLevelArray[component].count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return classTypeArray[component][row]
        } else {
            return courseLevelArray[component][row]
        }
    }
}
