//
//  UIColor + ext.swift
//  WorkoutApp
//
//  Created by Valeria Keshishyan on 02.10.2022.
//

import UIKit

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    static let active = UIColor(hexString: "#FD3A69")
    static let inactive = UIColor(hexString: "#C3C4C9")
    
    static let background = UIColor(hexString: "#E5E5E5")
    static let separator = UIColor(hexString: "#F3F5F9")
    static let secondary = UIColor(hexString: "#F0F3FF")
    
    static let titleGray = UIColor(hexString: "#545C77")
    
    static let pink = UIColor(hexString: "#FD3A69")
    static let lightPink = UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 0.4)
    static let lightGray = UIColor(hexString: "#AAAAAD")
    
    //Синие тона
    static let сyan = UIColor(hexString: "#00FFFF")
    static let lightCyan = UIColor(hexString: "#E0FFFF")
    static let paleTurquoise = UIColor(hexString: "#AFEEEE")
    static let aquamarine = UIColor(hexString: "#7FFFD4")
    static let turquoise = UIColor(hexString: "#40E0D0")
    static let mediumTurquoise = UIColor(hexString: "#48D1CC")
    static let darkTurquoise = UIColor(hexString: "#00CED1")
    static let cadetBlue = UIColor(hexString: "#5F9EA0")
    static let steelBlue = UIColor(hexString: "#4682B4")
    static let lightSteelBlue = UIColor(hexString: "#B0C4DE")
    static let powderBlue = UIColor(hexString: "#B0E0E6")
    static let lightBlue = UIColor(hexString: "#ADD8E6")
    static let skyBlue = UIColor(hexString: "#87CEEB")
    static let lightSkyBlue = UIColor(hexString: "#87CEFA")
    static let deepSkyBlue = UIColor(hexString: "#00BFFF")
    static let dodgerBlue = UIColor(hexString: "#1E90FF ")
    static let cornflowerBlue = UIColor(hexString: "#6495ED ")
    static let mediumSlateBlue = UIColor(hexString: "#7B68EE")
    static let royalBlue = UIColor(hexString: "#4169E1")
    static let blue = UIColor(hexString: "#0000FF")
    static let mediumBlue = UIColor(hexString: "#0000CD")
    static let darkBlue = UIColor(hexString: "#00008B")
    static let navy = UIColor(hexString: "#000080")
    static let midnightBlue = UIColor(hexString: "#191970")
}
