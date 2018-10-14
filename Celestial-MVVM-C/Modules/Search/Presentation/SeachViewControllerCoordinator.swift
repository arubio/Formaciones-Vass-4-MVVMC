//
//  SeachViewControllerCoordinator.swift
//  Celestial-MVVM-C
//
//  Created by VASS on 04/10/2018.
//  Copyright © 2018 VASS. All rights reserved.
//

import Foundation
import UIKit

final class SearchCoordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController, net: NetProtocol) {
        self.navigationController = navigationController
        
        self.navigationController.viewControllers = [
            ServiceLocator.shared.searchViewController(navigationDelegate: self, net: net)
        ]
    }
}

extension SearchCoordinator: SearchNavigationActions {
    func didSelect(_ item: SearchResultItem) {
        
    }
}

