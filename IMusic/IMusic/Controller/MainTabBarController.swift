//
//  MainTabBarController.swift
//  IMusic
//
//  Created by Эльдар Попов on 14.03.2021.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        // вызовем метод viewDidLoad и переиспользуем его через super
        super.viewDidLoad()

        view.backgroundColor = .orange
        
        tabBar.tintColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        
        viewControllers = [
            generateViewController(rootViewController: SearchViewController(), title: "Search", image: #imageLiteral(resourceName: "search")),
            generateViewController(rootViewController: ViewController(), title: "Library", image: #imageLiteral(resourceName: "library"))
        ]
    }
    
    private func generateViewController(rootViewController: UIViewController, title: String, image: UIImage) -> UINavigationController {
        let navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        rootViewController.navigationItem.title = title
        return navigationVC
    }
}
