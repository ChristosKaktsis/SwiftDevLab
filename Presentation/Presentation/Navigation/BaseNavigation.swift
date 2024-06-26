//
//  BaseNavigation.swift
//  SwiftDevLab
//
//  Created by Christos Kaktsis on 21/6/24.
//

import Foundation
import UIKit

public protocol Action {}
/** This protocol must be conformed from Coordinator in order to handle coordinator actions */
public protocol BaseActionHandler: AnyObject {
    func handleBaseAction(action: Action)
    func handleAction(action: Action)
}
