//
//  BaseViewModel.swift
//  SwiftDevLab
//
//  Created by Christos Kaktsis on 21/6/24.
//

import Foundation

protocol BaseViewModel {
    associatedtype Event
    func onTriggeredEvent(event: Event)
}
