//
//  MainCoordinator.swift
//  SwiftDevLab
//
//  Created by Christos Kaktsis on 20/6/24.
//

import Foundation
import UIKit
import Presentation

public struct GoToTest: Action {}

class MasterCoordinator: Coordinator {
    
    func handleAction(action: Action) {
        switch action {
        case _ as GoToTest:
            let vc = TestNavigateVC()
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
