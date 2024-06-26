//
//  PokemonCoordinator.swift
//  Presentation
//
//  Created by Christos Kaktsis on 26/6/24.
//

import Foundation
import UIKit

struct GoToList: Action {}

public class PokemonCoordinator: Coordinator {
    
    public var parentCoordinator: Coordinator?
    
    public var childCoordinators: [Coordinator]
    
    public var navigationController: UINavigationController
    
    public init(
        parentCoordinator: Coordinator? = nil,
        navigationController: UINavigationController
    ) {
        self.parentCoordinator = parentCoordinator
        self.childCoordinators = []
        self.navigationController = navigationController
        self.start()
    }
    
    public func start() {
        handleAction(action: GoToList())
    }
    
    public func handleAction(action: Action) {
        switch action {
        case _ as GoToList:
            let vm = PokemonListViewModel(actionHandler: self)
            let vc = PokemonListVC()
            navigationController.pushViewController(vc, animated: false)
        default:
            handleBaseAction(action: action)
        }
    }
}
