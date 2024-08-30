//
//  ColorPalette.swift
//  Presentation
//
//  Created by Christos Kaktsis on 23/8/24.
//

import UIKit

public protocol ColorDefinition {
    var value: UIColor { get }
}

public enum ColorPalette: ColorDefinition {
    case BlackViolet
    case ExtraDarkViolet
    case DarkViolet
    case Violet
    case SoftViolet
    case LightViolet
    case ExtraLightViolet
    case LimeGreen
    case DarkGreen
    case Green
    case SoftGreen
    case LightGreen
    case ExtraLightGreen
    case XXLightGreen
    case BugGreen
    case Gray
    case DarkGray
    case LightGray
    case Opacity70
    case Opacity50
    case Opacity24
    case Opacity20
    case Opacity8
    case Opacity0
    case White
    case Black
    case Red
    case FairyPink
    case PsyPink
    case Orange
    case DarkOrange
    case GhostPurple
    case PoisonPurple
    case ElectricYellow
    case GroundYellow
    case DragonBlue
    case FlyingBlue
    case IceBlue
    case WaterBlue
    case Rock
    
    case custom(hexString: String)
    
    public func withAlpha(_ alpha: Double) -> UIColor {
        return self.value.withAlphaComponent(CGFloat(alpha))
    }
}

public extension ColorPalette {
    
    var value: UIColor {
        var instanceColor = UIColor.clear
        
        switch self {
        case .BlackViolet:
            instanceColor = UIColor(hexString: "#14002F")
        case .ExtraDarkViolet:
            instanceColor = UIColor(hexString: "#1D0046")
        case .DarkViolet:
            instanceColor = UIColor(hexString: "#310075")
        case .Violet:
            instanceColor = UIColor(hexString: "#5800D3")
        case .SoftViolet:
            instanceColor = UIColor(hexString: "#B180F5")
        case .LightViolet:
            instanceColor = UIColor(hexString: "#D0B3F9")
        case .ExtraLightViolet:
            instanceColor = UIColor(hexString: "#EFE6FD")
        case .LimeGreen:
            instanceColor = UIColor(hexString: "#36FFC6")
        case .DarkGreen:
            instanceColor = UIColor(hexString: "#104C3B")
        case .Green:
            instanceColor = UIColor(hexString: "#2BCC9E")
        case .SoftGreen:
            instanceColor = UIColor(hexString: "#31E6B2")
        case .LightGreen:
            instanceColor = UIColor(hexString: "#9BFFE3")
        case .ExtraLightGreen:
            instanceColor = UIColor(hexString: "#D7FFF4")
        case .XXLightGreen:
            instanceColor = UIColor(hexString: "#EBFFF9")
        case .BugGreen:
            instanceColor = UIColor(hexString: "#7c9e4d")
        case .Gray:
            instanceColor = UIColor(hexString: "#abb2b9")
        case .DarkGray:
            instanceColor = UIColor(hexString: "#808080")
        case .LightGray:
            instanceColor = UIColor(hexString: "#f2f2f2")
        case .Opacity70:
            instanceColor = UIColor(hexString: "#D9D5DD")
        case .Opacity50:
            instanceColor = UIColor(hexString: "#C8C3CE")
        case .Opacity24:
            instanceColor = UIColor(hexString: "#BAB5C2")
        case .Opacity20:
            instanceColor = UIColor(hexString: "#EFEEF1")
        case .Opacity8:
            instanceColor = UIColor(red: 0.078, green: 0, blue: 0.184, alpha: 0.08)
        case .Opacity0:
            instanceColor = UIColor(red: 0.078, green: 0, blue: 0.184, alpha: 0)
        case .White:
            instanceColor = UIColor(hexString: "#FFFFFF")
        case .Black:
            instanceColor = UIColor(hexString: "#000000")
        case .custom(hexString: let hexString):
            instanceColor = UIColor(hexString: hexString)
        case .Red:
            instanceColor = UIColor(hexString: "#ff0000")
        case .FairyPink:
            instanceColor = UIColor(hexString: "#f3bce6")
        case .PsyPink:
            instanceColor = UIColor(hexString: "#e26fb6")
        case .Orange:
            instanceColor = UIColor(hexString: "#ed843e")
        case .DarkOrange:
            instanceColor = UIColor(hexString: "#c76d36")
        case .GhostPurple:
            instanceColor = UIColor(hexString: "#77639f")
        case .PoisonPurple:
            instanceColor = UIColor(hexString: "#b081c4")
        case .ElectricYellow:
            instanceColor = UIColor(hexString: "#ead657")
        case .GroundYellow:
            instanceColor = UIColor(hexString: "#f3df5f")
        case .DragonBlue:
            instanceColor = UIColor(hexString: "#67a2cb")
        case .FlyingBlue:
            instanceColor = UIColor(hexString: "#69c4ea")
        case .IceBlue:
            instanceColor = UIColor(hexString: "#71c1e3")
        case .WaterBlue:
            instanceColor = UIColor(hexString: "#5990bf")
        case .Rock:
            instanceColor = UIColor(hexString: "#9f8d38")
        }
        return instanceColor
    }
}
