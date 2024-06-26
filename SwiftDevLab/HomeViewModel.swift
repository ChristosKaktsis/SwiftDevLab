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
            actionHandler?.handleAction(action: GoToTest())
        }
    }
    
    private func createTestUser() {
        let testUser = TestModel(id: "1", name: "Chris Test")
    }
}
 
