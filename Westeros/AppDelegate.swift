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


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.backgroundColor = .cyan
        window?.makeKeyAndVisible()
        
        
        // Crear unos modelos
        let houses = Repository.local.houses
        let seasons = Repository.local.seasons
        
//>>FJGO Practica de Alexandre desde el primer dia
        // Crear los controladorer
//        let starkHouseViewController = HouseDetailViewController(model: starkHouse)
//
//        let lannisterHouseViewController = HouseDetailViewController(model: lannisterHouse)
        
// esto tb se puede hacer con map
//        var controllers = [UIViewController]()
//        for house in houses{
//            controllers.append(HouseDetailViewController(model: house))
//        }
        
        
//        let controllers = houses.map{
//            house in return HouseDetailViewController(model: house).wrappedInNavigation()
//        }
        
//        let starkNavigationController = UINavigationController(rootViewController: starkHouseViewController)
//
//        let lanisterNavigationController = UINavigationController(rootViewController: lannisterHouseViewController)
        
        // Creamos los combinadores
//        let tabBarViewController = UITabBarController()
//        tabBarViewController.viewControllers = [
//            starkHouseViewController.wrappedInNavigation(), lannisterHouseViewController.wrappedInNavigation()
//        ]
        
//        var navigationsControllers = [UINavigationController]()
//        for controller in controllers{
//            navigationsControllers.append(controller.wrappedInNavigation())
//        }
        
        //Creamos el tabBar View Controller para mostrar los detail
//        let tabBarViewController = UITabBarController()
//        tabBarViewController.viewControllers =
//            houses
//                .map{return HouseDetailViewController(model: $0)}
//                .map{$0.wrappedInNavigation()}
//<<FJGO Practica de Alexandre desde el primer dia
        
//>>FJGO Solo con lista de houses
//        //Creamos el table
//        let houseListVC = HouseListViewController(house: houses)
//        let lastSelectedHouse = houseListVC.lastSelectedHouse()
//        let houseDetailVC = HouseDetailViewController(model: lastSelectedHouse)
//
//        //Asignar delegados
//        houseListVC.delegate = houseDetailVC
//
//        let splitVC = UISplitViewController()
//        splitVC.viewControllers = [
//            houseListVC.wrappedInNavigation(),
//            houseDetailVC.wrappedInNavigation()
//        ]
//
//        // Asignamos el rootVC
//        window?.rootViewController = splitVC
//<<FJGO Solo con lista de houses
        
        let houseListVC = HouseListViewController(house: houses)
        let lastSelectedHouse = houseListVC.lastSelectedHouse()
        let houseDetailVC = HouseDetailViewController(model: lastSelectedHouse)
        
        //Asignar delegados
        houseListVC.delegate = houseDetailVC
        
        let seasonListVC = SeasonListViewControler(season: seasons)
        //TODO let lastSelectedSeason = houseListVC.lastSelectedHouse()
        //TODO let seasonDetailVC = HouseDetailViewController(model: lastSelectedHouse)
        
        let houseNC = UINavigationController(rootViewController: houseListVC)
        let seasonNC = UINavigationController(rootViewController: seasonListVC)
        
        let tabBarVC = UITabBarController()
        tabBarVC.viewControllers = [
            houseNC,
            seasonNC
        ]
        
        let splitVC = UISplitViewController()
        splitVC.viewControllers = [
            tabBarVC.wrappedInNavigation(),
            houseDetailVC.wrappedInNavigation()
        ]
        
        // Asignamos el rootVC
        window?.rootViewController = splitVC
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

