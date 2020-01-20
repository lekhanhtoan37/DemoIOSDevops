//
//  Coordinator.swift
//  DemoIOSDevops
//
//  Created by Le Toan on 1/6/20.
//  Copyright © 2020 LeToan. All rights reserved.
//

import UIKit
protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var parentCoordinator: Coordinator? { get set }
    
    func start()
    func start(coordinator: Coordinator)
    func didFinish(coordinator: Coordinator)
    func removeChildCoordinators()
    
}
