//
//  AppCoordinator.swift
//  DemoIOSDevops
//
//  Created by Le Toan on 1/6/20.
//  Copyright © 2020 LeToan. All rights reserved.
//

import UIKit

class AppCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
 
    private var window = UIWindow(frame: UIScreen.main.bounds)
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
//        self.window.makeKeyAndVisible()
        showLogin()
        
    }
    func start(coordinator: Coordinator) {
         self.childCoordinators += [coordinator]
         coordinator.parentCoordinator = self
         coordinator.start()
    }
    
    func didFinish(coordinator: Coordinator) {
        
    }
    
    private func showLogin() {
        self.removeChildCoordinators()
//        self.start(coordinator: LoginCoordinator(viewModel: LoginViewModels(), navigation: navigationController))

    }
    
    func removeChildCoordinators() {
        self.childCoordinators.forEach { $0.removeChildCoordinators() }
        self.childCoordinators.removeAll()
    }
    
}

