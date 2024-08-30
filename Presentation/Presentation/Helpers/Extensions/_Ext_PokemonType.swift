//
//  _Ext_PokemonType.swift
//  Presentation
//
//  Created by Christos Kaktsis on 26/8/24.
//

import Foundation
import Domain

extension PokemonTypeCase {
    public var color: ColorPalette {
        switch self {
        case .normal:
            return .Gray
        case .fire:
            return .Orange
        case .water:
            return .WaterBlue
        case .grass:
            return .Green
        case .electric:
            return .ElectricYellow
        case .ice:
            return .IceBlue
        case .fighting:
            return .DarkOrange
        case .poison:
            return .PoisonPurple
        case .ground:
            return .GroundYellow
        case .flying:
            return .FlyingBlue
        case .psychic:
            return .PsyPink
        case .bug:
            return .BugGreen
        case .rock:
            return .Rock
        case .ghost:
            return .GhostPurple
        case .dragon:
            return .DragonBlue
        case .dark:
            return .DarkGray
        case .steel:
            return .LightGray
        case .fairy:
            return .FairyPink
        case .unknown:
            return .DarkGray
        default:
            return .DarkGray
        }
    }
}
