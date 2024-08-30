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
    var childCoordinators: [CoordinatorKey: Coordinator] { get set }
    var navigationController: UINavigationController { get set}
    var coordinatorKey: CoordinatorKey { get }
    
    func start()
    func stop(completion: (() -> Void)?)
    func dismiss(animated: Bool, completion: (() -> Void)?)
    func addChild(coordinator: Coordinator, with key: CoordinatorKey)
    func removeChild(coordinator: Coordinator)
}

extension Coordinator {
    public func handleBaseAction(action: BaseAction) {
        
    }
    public func addChild(
        coordinator: Coordinator,
        with key: CoordinatorKey
    ) {
        childCoordinators[key] = coordinator
    }
    
    public func removeChild(coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter {
            $0.value !== coordinator
        }
    }
    
    public func removeChild(_ key: CoordinatorKey) {
        if let coord = childCoordinators[key] {
            removeChild(coordinator: coord)
            print("Coordinator with key: \(key) removed")
        }
    }
    
    public func getCoordingator(_ key: CoordinatorKey) -> Coordinator? {
        return childCoordinators[key]
    }
    
    public func stop(completion: (() -> Void)? = nil) {
        self.parentCoordinator?.removeChild(coordinator: self)
        completion?()
    }
    
    public func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController.dismiss(animated: animated) { [weak self] in
            guard let self = self else { return }
            completion?()
            self.stop()
        }
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
