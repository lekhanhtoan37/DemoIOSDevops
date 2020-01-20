//
//  TrendingCoordinator.swift
//  DemoIOSDevops
//
//  Created by Le Toan on 1/7/20.
//  Copyright © 2020 LeToan. All rights reserved.
//

import UIKit

class TrendingCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    var parentCoordinator: Coordinator?
    
    func start() {
        
    }
    
    func start(coordinator: Coordinator) {
        
    }
    
    func didFinish(coordinator: Coordinator) {
        
    }
    
    func removeChildCoordinators() {
        
    }
    
}
