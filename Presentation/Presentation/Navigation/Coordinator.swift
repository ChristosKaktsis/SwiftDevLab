//
//  Coordinator.swift
//  SwiftDevLab
//
//  Created by Christos Kaktsis on 20/6/24.
//

import Foundation
import UIKit
import SwiftUI

enum Event {
    case buttonTapped
}

public protocol Coordinator: AnyObject, BaseActionHandler {
    var parentCoordinator: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set}
    
    func start()
}

extension Coordinator {
    public func handleBaseAction(action: BaseAction) {
        
    }
}

extension Coordinator {
    public func navigate(to viewController: UIViewController, with presentationStyle: NavigationStyle, animated: Bool = true) {
        switch presentationStyle {
        case .present:
            viewController.modalPresentationStyle = .fullScreen
            viewController.definesPresentationContext = true
            navigationController.present(viewController, animated: animated, completion: nil)
        case .push:
            navigationController.pushViewController(viewController, animated: animated)
        case .pushAndPopLast:
            navigationController.viewControllers.popLast()
            navigationController.pushViewController(viewController, animated: animated)
        case .overCurrentContext:
            viewController.modalPresentationStyle = .overCurrentContext
            navigationController.present(viewController, animated: true, completion: nil)
        case .overFullScreen:
            viewController.modalPresentationStyle = .overFullScreen
            navigationController.present(viewController, animated: true, completion: nil)
        case .pop:
            navigationController.popViewController(animated: true)
        }
    }
    
    public func navigate(to screen: some View, with presentationStyle: NavigationStyle, animated: Bool = true) {
        let viewController = UIHostingController(rootView: screen)
        navigate(to: viewController, with: presentationStyle, animated: animated)
    }
}

public enum NavigationStyle {
    case present
    case push
    case overCurrentContext
    case overFullScreen
    case pop
    case pushAndPopLast
}
