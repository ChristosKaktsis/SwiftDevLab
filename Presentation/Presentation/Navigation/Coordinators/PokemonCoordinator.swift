//
//  PokemonCoordinator.swift
//  Presentation
//
//  Created by Christos Kaktsis on 26/6/24.
//

import Foundation
import UIKit

public class PokemonCoordinator: Coordinator {
    public var childCoordinators: [CoordinatorKey : Coordinator]
    
    public let coordinatorKey: CoordinatorKey = .Pokemon
    
    public var parentCoordinator: Coordinator?
    
    public var navigationController: UINavigationController
    
    public init(
        parentCoordinator: Coordinator? = nil,
        navigationController: UINavigationController
    ) {
        self.parentCoordinator = parentCoordinator
        self.childCoordinators = [:]
        self.navigationController = navigationController
        self.start()
    }
    
    public func start() {
        handleAction(action: .goToPokemonList)
    }
    
    public func handleAction(action: BaseAction) {
        switch action {
        case .GENERAL_ACTION(let action):
            MainNavigationAction.handleAction(
                action: action,
                navigationController: navigationController,
                coordinator: self
            )
        case .goToPokemonList:
            let vm = PokemonListViewModel(actionHandler: self)
            let vc = PokemonListVC(viewModel: vm)
            let screen = PokemonListScreen()
            navigate(to: screen, with: .push)
        case .stop:
            self.stop {[weak self] in
                self?.handleAction(action: .GENERAL_ACTION(action: .POP()))
            }
        default:
            handleBaseAction(action: action)
        }
    }
}
