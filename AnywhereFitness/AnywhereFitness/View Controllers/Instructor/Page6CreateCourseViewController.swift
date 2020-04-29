//
//  Page6CreateCourseViewController.swift
//  AnywhereFitness
//
//  Created by Christopher Devito on 4/28/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import UIKit

class Page6CreateCourseViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var backgroundImage: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.setBackground()
    }

    // MARK: - IBActions
    @IBAction func viewClassesTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: false)
        performSegue(withIdentifier: "ManageClassesSegue", sender: self)
    }

    @IBAction func addClassTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }

}
