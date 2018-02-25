//
//  UIViewController+Additions.swift
//  Westeros
//
//  Created by Javi on 13/2/18.
//  Copyright © 2018 Javi. All rights reserved.
//

import UIKit

extension UIViewController{
    func wrappedInNavigation() -> UINavigationController{
        return UINavigationController(rootViewController: self)
    }
}
