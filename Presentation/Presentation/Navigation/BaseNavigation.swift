//
//  BaseNavigation.swift
//  SwiftDevLab
//
//  Created by Christos Kaktsis on 21/6/24.
//

import Foundation
import UIKit

public enum BaseAction {
    case GENERAL_ACTION(action: GeneralNavigationActions)
    case goToPokemon
    case goToTest
    case goToPokemonList
    case goToMap
    case stop
}

public enum GeneralNavigationActions {
    case POP(animated: Bool = false)
    case POP_TO_ROOT_VIEW_CONTROLLER(animated: Bool = false)
    case DISMISS
}

/** This protocol must be conformed from Coordinator in order to handle coordinator actions */
public protocol BaseActionHandler: AnyObject {
    func handleBaseAction(action: BaseAction)
    func handleAction(action: BaseAction)
}


public class MainNavigationAction {
    public static func handleAction(
        action: GeneralNavigationActions,
        navigationController: UINavigationController?,
        coordinator: Coordinator
    ) {
        switch action {
        case .POP(let animated):
            DispatchQueue.main.async {
                if navigationController?.viewControllers.count ?? 0 > 1 {
                    navigationController?.popViewController(animated: animated)
                }
            }
        case .POP_TO_ROOT_VIEW_CONTROLLER(let animated):
            navigationController?.popToRootViewController(animated: animated)
        case .DISMISS:
            navigationController?.presentedViewController?.dismiss(animated: true, completion: nil)
        
            
        }
    }
}
