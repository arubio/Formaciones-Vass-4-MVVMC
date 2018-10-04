//
//  BaseViewModel.swift
//  Celestial-MVVM-C
//
//  Created by VASS on 04/10/2018.
//  Copyright © 2018 VASS. All rights reserved.
//

import Foundation

protocol ViewModable {
    func viewDidLoad()
    func viewWillAppear()
    func viewWillLayoutSubviews()    
}

/// Providing an empty implementation, our viewModels won't have to conform to this protocols mandatorily, but will be able to use that trigger if the need arises.

extension ViewModable {
    func viewWillAppear() { }
    func viewWillLayoutSubviews() { }
}
