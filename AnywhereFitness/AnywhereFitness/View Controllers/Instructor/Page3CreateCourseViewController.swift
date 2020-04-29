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
    lazy var days: [Bool] = {
        var temp: [Bool] = [sunday]
        return temp
    }()
    lazy var dayButtons: [UIButton] = {
        var temp: [UIButton] = [sundayButton]
        return temp
    }()
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var classCost: UITextField!
    @IBOutlet weak var classStartTime: UITextField!
    @IBOutlet weak var classEndTime: UILabel!
    @IBOutlet var sundayButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - IBAction
    @IBAction func sundayButtonTapped(_ sender: Any) {
        sunday.toggle()
        sundayButton.backgroundColor = sunday ? .systemOrange : .systemGray
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
