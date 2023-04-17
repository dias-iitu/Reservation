//
//  MainTabBar.swift
//  ReservationApp
//
//  Created by Niyazov Makhmujan on 11.04.2023.
//

import UIKit

class MainTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        tabBar.backgroundColor = .white
        tabBar.tintColor = #colorLiteral(red: 0.6706767678, green: 0.112393342, blue: 0.1214761063, alpha: 1)
        tabBar.unselectedItemTintColor = #colorLiteral(red: 0.4880174994, green: 0.4780977964, blue: 0.4782758951, alpha: 1)
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = #colorLiteral(red: 0.9098039269, green: 0.9098039269, blue: 0.9098039269, alpha: 1).cgColor
        
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(
                viewController: MenuViewController(),
                title: "Меню",
                image: UIImage(named: "menu")
            ),
            generateVC(
                viewController: ReservationViewController(),
                title: "Мои брони",
                image: UIImage(named: "reservation")
            ),
            generateVC(
                viewController: CartViewController(),
                title: "Корзина",
                image: UIImage(named: "cart")
            ),
            generateVC(
                viewController: AccountViewController(),
                title: "Профиль",
                image: UIImage(named: "user"))
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
}
