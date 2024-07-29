//
//  PokemonCoordinator.swift
//  Presentation
//
//  Created by Christos Kaktsis on 26/6/24.
//

import Foundation
import UIKit

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
        handleAction(action: .goToPokemonList)
    }
    
    public func handleAction(action: BaseAction) {
        switch action {
        case .goToPokemonList:
            let vm = PokemonListViewModel(actionHandler: self)
            let vc = PokemonListVC(viewModel: vm)
            navigationController.pushViewController(vc, animated: false)
        default:
            handleBaseAction(action: action)
        }
    }
}
