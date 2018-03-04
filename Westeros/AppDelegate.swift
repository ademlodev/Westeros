//
//  AppDelegate.swift
//  Westeros
//
//  Created by Javi on 8/2/18.
//  Copyright © 2018 Javi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var houseListNC: UINavigationController!
    var houseDetailNC: UINavigationController!
    
    var seasonListNC: UINavigationController!
    var seasonDetailNC: UINavigationController!
    
    var tabBarVC: UITabBarController!
    var splitVC: UISplitViewController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.backgroundColor = .cyan
        window?.makeKeyAndVisible()

        // Crear unos modelos
        let houses = Repository.local.houses
        let seasons = Repository.local.seasons
        
        let houseListVC = HouseListViewController(house: houses)
        let lastSelectedHouse = houseListVC.lastSelectedHouse()
        let houseDetailVC = HouseDetailViewController(model: lastSelectedHouse)
        
        //Asignar delegados
        houseListVC.delegate = houseDetailVC
        
        let seasonListVC = SeasonListViewController(seasons: seasons)
        let lastSelectedSeason = seasonListVC.lastSelectedSeason()
        let seasonDetailVC = SeasonDetailViewController(seasonObj: lastSelectedSeason)
        
        //Asignar delegados
        seasonListVC.delegate = seasonDetailVC
        
        houseListNC = houseListVC.wrappedInNavigation()
        seasonListNC = seasonListVC.wrappedInNavigation()
        
        tabBarVC = UITabBarController()
        tabBarVC.viewControllers = [
            houseListNC,
            seasonListNC
        ]
        
        tabBarVC.delegate = self
        
        houseDetailNC = houseDetailVC.wrappedInNavigation()
        seasonDetailNC = seasonDetailVC.wrappedInNavigation()
        
        splitVC = UISplitViewController()
        splitVC.viewControllers = [
            tabBarVC,
            houseDetailNC,
            seasonDetailNC
        ]
        
        // Asignamos el rootVC
        window?.rootViewController = splitVC
        
        return true
    }

}

extension AppDelegate: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let nc = viewController as? UINavigationController,
            let vc = nc.viewControllers.first else { return }
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            // Estamos en iPad
            if (vc is HouseListViewController){
                self.splitVC.showDetailViewController(self.houseDetailNC, sender: nil)
            }else{
                self.splitVC.showDetailViewController(self.seasonDetailNC, sender: nil)
            }
        }
        
    }
}

