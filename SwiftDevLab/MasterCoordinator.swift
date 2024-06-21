//
//  MainCoordinator.swift
//  SwiftDevLab
//
//  Created by Christos Kaktsis on 20/6/24.
//

import Foundation
import UIKit

public struct GoToTest: Action {}

class MasterCoordinator: Coordinator {
    
    func handleAction(action: Action) {
        switch action {
        case _ as GoToTest:
            let vc = TestNavigateVC()
            vc.coordinator = self
            self.navigationController.pushViewController(vc, animated: true)
        default:
            handleBaseAction(action: action)
        }
    }
    
    func eventOccurred(with type: Event) {
        switch type {
        case .buttonTapped:
            let vc = TestNavigateVC()
            vc.coordinator = self
            self.navigationController.pushViewController(vc, animated: true)
        }
    }
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
       let vc = HomeVC()
        vc.coordinator = self
        navigationController.setViewControllers([vc], animated: false)
    }
    
    
}
