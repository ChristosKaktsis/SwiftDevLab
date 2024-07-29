//
//  HomeViewModel.swift
//  SwiftDevLab
//
//  Created by Christos Kaktsis on 21/6/24.
//

import Foundation
import Domain
import Presentation

enum HomeEvents {
    case GoToTest
    case GoToMap
}

class HomeViewModel: BaseViewModel {
    
    private weak var actionHandler: BaseActionHandler?
    typealias Event = HomeEvents
    
    init(actionHandler: BaseActionHandler? = nil) {
        self.actionHandler = actionHandler
    }
    
    func onTriggeredEvent(event: Event) {
        switch event {
        case .GoToTest:
            actionHandler?.handleAction(action: .goToPokemon)
        case .GoToMap:
            actionHandler?.handleAction(action: .goToMap)
        }
    }
    
    private func createTestUser() {
    }
}
 
