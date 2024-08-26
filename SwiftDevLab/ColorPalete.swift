//
//  ColorPalete.swift
//  SwiftDevLab
//
//  Created by Christos Kaktsis on 22/8/24.
//

import UIKit

public protocol ColorDefinition {
    var value: UIColor { get }
}

public enum ColorPalete: ColorDefinition {
    case VioletA
    case BlackViolet
    case ExtraDarkViolet
    case DarkViolet
    case Violet
    case VioletWith24Overlay
    case SoftViolet
    case LightViolet
    case ExtraLightViolet
    case LimeGreen
    case DarkGreen
    case Green
    case SoftGreen
    case SoftGreenWith24Overlay
    case LightGreen
    case ExtraLightGreen
    case XXLightGreen
    case DarkGrey
    case Opacity70
    case Opacity50
    case Opacity24
    case Opacity20
    case Opacity8
    case Opacity0
    case White
    case Info
    case InfoLight
    case InfoDark
    case Success
    case SuccessLight
    case SuccessDark
    case WError
    case WErrorLight
    case WErrorDark
    case ErrorSoft
    case Black
    
    case custom(hexString: String)
    
    public func withAlpha(_ alpha: Double) -> UIColor {
        return self.value.withAlphaComponent(CGFloat(alpha))
    }
}

public extension ColorPalete {
    
    var value: UIColor {
        var instanceColor = UIColor.clear
        
        switch self {
        case .VioletA:
            instanceColor = UIColor(hexString: "#6200EA")
        case .BlackViolet:
            instanceColor = UIColor(hexString: "#14002F")
        case .ExtraDarkViolet:
            instanceColor = UIColor(hexString: "#1D0046")
        case .DarkViolet:
            instanceColor = UIColor(hexString: "#310075")
        case .Violet:
            instanceColor = UIColor(hexString: "#5800D3")
        case .VioletWith24Overlay:
            instanceColor = UIColor(hexString: "#4800AC")
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
        case .SoftGreenWith24Overlay:
            instanceColor = UIColor(hexString: "#2CAF92")
        case .LightGreen:
            instanceColor = UIColor(hexString: "#9BFFE3")
        case .ExtraLightGreen:
            instanceColor = UIColor(hexString: "#D7FFF4")
        case .XXLightGreen:
            instanceColor = UIColor(hexString: "#EBFFF9")
        case .DarkGrey:
            instanceColor = UIColor(hexString: "#8F879C")
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
        case .InfoLight:
            instanceColor = UIColor(hexString: "#EAF0FD")
        case .Info:
            instanceColor = UIColor(hexString: "#416DDC")
        case .InfoDark:
            instanceColor = UIColor(hexString: "#193273")
        case .SuccessLight:
            instanceColor = UIColor(hexString: "#D7FFF4")
        case .Success:
            instanceColor = UIColor(hexString: "#1EA47E")
        case .SuccessDark:
            instanceColor = UIColor(hexString: "#104C3B")
        case .WErrorLight:
            instanceColor = UIColor(hexString: "#FFD7E2")
        case .WError:
            instanceColor = UIColor(hexString: "#DC4165")
        case .WErrorDark:
            instanceColor = UIColor(hexString: "#66162C")
        case .ErrorSoft:
            instanceColor = UIColor(hexString: "#F47B97")
        case .Black:
            instanceColor = UIColor(hexString: "#000000")
        case .custom(hexString: let hexString):
            instanceColor = UIColor(hexString: hexString)
        }
        return instanceColor
    }
}
