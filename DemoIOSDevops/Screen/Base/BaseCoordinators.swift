import UIKit

class BaseCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    var parentCoordinator: Coordinator?
    init(navigation: UINavigationController) {
        self.navigationController = navigation
    }
    
    func didFinish(coordinator: Coordinator) {
        
    }
    func start(coordinator: Coordinator) {
         self.childCoordinators += [coordinator]
         coordinator.parentCoordinator = self
         coordinator.start()
     }
    
    func removeChildCoordinators() {
        self.childCoordinators.forEach { $0.removeChildCoordinators() }
        self.childCoordinators.removeAll()
    }
    
    func start() {

    }
    
}
