//
//  BaseController.swift
//  TestHammerSystem
//
//  Created by Valeria Keshishyan on 02.04.2023.
//

import UIKit

enum NavBarPosition {
    case left
    case right
}

class BaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        constraintViews()
        configureAppearance()
    }
}

@objc extension BaseController {

    func setupViews() {}
    func constraintViews() {}
    func configureAppearance() {}
}
