//
//  Resourses.swift
//  WorkoutApp
//
//  Created by Valeria Keshishyan on 02.10.2022.
//

import UIKit

enum R {
        
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
}
