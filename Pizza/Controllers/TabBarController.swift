//
//  TabBarController.swift
//  TestHammerSystem
//
//  Created by Valeria Keshishyan on 02.04.2023.
//

import UIKit

enum Tabs: Int, CaseIterable {
    case menu
    case contat
    case profile
    case backet
}

final class TabBarController: UITabBarController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        configureAppearance()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureAppearance()
    }

    func switchTo(tab: Tabs) {
        selectedIndex = tab.rawValue
    }

    private func configureAppearance() {        
        tabBar.tintColor = .active
        tabBar.barTintColor = .inactive
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = UIColor.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true

        let controllers: [NavBarController] = Tabs.allCases.map { tab in
            let controller = NavBarController(rootViewController: getController(for: tab))
            controller.tabBarItem = UITabBarItem(title: R.Strings.TabBar.title(for: tab),
                                                 image: R.Images.TabBar.icon(for: tab),
                                                 tag: tab.rawValue)
            controller.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.tab], for: .normal)
            return controller
        }

        setViewControllers(controllers, animated: false)
    }

    private func getController(for tab: Tabs) -> BaseController {
        switch tab {
        case .menu: return MenuVC()
        case .contat: return MenuVC() //!
        case .profile: return MenuVC() //!
        case .backet: return MenuVC() //!
        }
    }
}
