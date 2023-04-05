//
//  Resourses.swift
//  WorkoutApp
//
//  Created by Valeria Keshishyan on 02.10.2022.
//

import UIKit

enum R {
    
    enum Colors {
        
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
    
    enum Strings {
        enum TabBar {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .menu: return "Меню"
                case .contat: return "Контаты"
                case .profile: return "Профиль"
                case .backet: return "Корзина"
                }
            }
        }
    }

    enum Images {
        enum TabBar {
            static func icon(for tab: Tabs) -> UIImage? {
                switch tab {
                case .menu: return UIImage(named: "menu")
                case .contat: return UIImage(named: "contat")
                case .profile: return UIImage(named: "profile")
                case .backet: return UIImage(named: "backet")
                }
            }
        }
    }
    
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) ->UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
        static func helveticaBoldRegular(with size: CGFloat) ->UIFont {
            UIFont(name: "Helvetica-Bold", size: size) ?? UIFont()
        }
        
        static func SFUIDisplay(with size: CGFloat) ->UIFont {
            UIFont(name: "SF UI Display", size: size) ?? UIFont()
        }
    }

}
