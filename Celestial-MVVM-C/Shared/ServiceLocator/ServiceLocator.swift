//
//  ServiceLocator.swift
//  Celestial-MVVM-C
//
//  Created by VASS on 04/10/2018.
//  Copyright © 2018 VASS. All rights reserved.
//

import Foundation
import UIKit

final class ServiceLocator {

    private init() { }
    static var shared = ServiceLocator()
    
    func searchCoordinator(navigationController: UINavigationController, net: NetProtocol) -> SearchCoordinator {
        return SearchCoordinator(navigationController: navigationController, net: net)
    }
    
    func searchViewController(navigationDelegate: SearchNavigationActions, net: NetProtocol) -> SearchViewController {
        return SearchViewController(
            viewModel: searchViewModel(navigationDelegate: navigationDelegate,
                                       net: net),
            nibName: "SearchViewController"
        )
    }
    
    func searchViewModel(navigationDelegate: SearchNavigationActions, net: NetProtocol) -> SearchViewModel {
        
        return SearchViewModel(coordinator: navigationDelegate, netProvider: net)
    }
}
