//
//  Coordinator.swift
//  SwiftDevLab
//
//  Created by Christos Kaktsis on 20/6/24.
//

import Foundation
import UIKit

enum Event {
    case buttonTapped
}

public protocol Coordinator: AnyObject, BaseActionHandler {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set}
    
    func start()
}

extension Coordinator {
    public func handleBaseAction(action: Action) {
        
    }
}
