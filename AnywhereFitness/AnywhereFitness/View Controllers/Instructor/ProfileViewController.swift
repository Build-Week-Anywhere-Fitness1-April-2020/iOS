//
//  ProfileViewController.swift
//  AnywhereFitness
//
//  Created by Christopher Devito on 4/29/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var backgroundImage: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.setBackground()
    }

}
