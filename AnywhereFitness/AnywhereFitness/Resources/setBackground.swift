//
//  setBackground.swift
//  AnywhereFitness
//
//  Created by Christopher Devito on 4/28/20.
//  Copyright © 2020 Christopher Devito. All rights reserved.
//

import UIKit

extension UIView {
    func setBackground(toImageNamed image: String = "BackgroundImage") {
        guard let backgroundImage = UIImage(named: image) else { return }
        let backgroundImageView = UIImageView(frame: self.bounds)
        backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.alpha = CGFloat(exactly: NSNumber(value: 0.75))!
        self.insertSubview(backgroundImageView, at: 0)
    }

}
