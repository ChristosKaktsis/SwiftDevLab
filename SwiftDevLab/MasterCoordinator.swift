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
    var parentCoordinator: Coordinator?
    
    func handleAction(action: BaseAction) {
        switch action {
        case .goToTest:
            let vc = TestNavigateVC()
            self.navigationController.pushViewController(vc, animated: true)
        case .goToPokemon:
            let coordinator = PokemonCoordinator(parentCoordinator: self, navigationController: navigationController)
            childCoordinators.append(coordinator)
        case .goToMap:
            let vc = MapDrawVC()
            self.navigationController.pushViewController(vc, animated: true)
        default:
            handleBaseAction(action: action)
        }
    }
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let vm = HomeViewModel(actionHandler: self)
        let vc = HomeVC(viewModel: vm)
        navigationController.setViewControllers([vc], animated: false)
    }
    
    
}
