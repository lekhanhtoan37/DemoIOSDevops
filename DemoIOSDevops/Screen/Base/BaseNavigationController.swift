//
//  BaseNavigationControlle.swift
//  {{cookiecutter.app_name}}
//
//  Created by Le Toan on 11/18/19.
//  Copyright © 2019 {{cookiecutter.company_name}}. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isTranslucent = false
        self.navigationBar.tintColor = .white
        self.navigationBar.barTintColor = Constants.mainColor
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
