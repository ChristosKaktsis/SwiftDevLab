//
//  MainCoordinator.swift
//  SwiftDevLab
//
//  Created by Christos Kaktsis on 20/6/24.
//

import Foundation
import UIKit
import Presentation

class MasterCoordinator: Coordinator {
    
    var childCoordinators: [CoordinatorKey : Coordinator]
    
    let coordinatorKey: CoordinatorKey = .Master
    
    var parentCoordinator: Coordinator?
    
    func handleAction(action: BaseAction) {
        switch action {
        case .goToTest:
            let vc = TestNavigateVC()
            self.navigationController.pushViewController(vc, animated: true)
        case .goToPokemon:
            let coordinator = PokemonCoordinator(parentCoordinator: self, navigationController: navigationController)
            addChild(coordinator: coordinator, with: .Pokemon)
        case .goToMap:
            let vc = MapDrawVC()
            self.navigationController.pushViewController(vc, animated: true)
        default:
            handleBaseAction(action: action)
        }
    }
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
        // Hide the toolbar for this view controller
        self.navigationController.navigationBar.isHidden = true
        self.childCoordinators = [:]
    }
    
    func start() {
        let vm = HomeViewModel(actionHandler: self)
        let vc = HomeVC(viewModel: vm)
        navigationController.setViewControllers([vc], animated: false)
    }
    
    
}
