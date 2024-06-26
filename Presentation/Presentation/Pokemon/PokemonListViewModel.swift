//
//  PokemonViewModel.swift
//  SwiftDevLab
//
//  Created by Christos Kaktsis on 21/6/24.
//

import Foundation
import Domain

enum PokemonEvents {
    case GoToTest
}

class PokemonListViewModel: BaseViewModel {
    
    private weak var actionHandler: BaseActionHandler?
    typealias Event = PokemonEvents
    
    init(actionHandler: BaseActionHandler? = nil) {
        self.actionHandler = actionHandler
    }
    
    func onTriggeredEvent(event: Event) {
        
    }
}
 
