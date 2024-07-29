//
//  BaseNavigation.swift
//  SwiftDevLab
//
//  Created by Christos Kaktsis on 21/6/24.
//

import Foundation
import UIKit

public enum BaseAction {
    case goToPokemon
    case goToTest
    case goToPokemonList
    case goToMap
}

/** This protocol must be conformed from Coordinator in order to handle coordinator actions */
public protocol BaseActionHandler: AnyObject {
    func handleBaseAction(action: BaseAction)
    func handleAction(action: BaseAction)
}
