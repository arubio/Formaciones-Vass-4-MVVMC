//
//  Resource.swift
//  Celestial-MVVM-C
//
//  Created by VASS on 04/10/2018.
//  Copyright © 2018 VASS. All rights reserved.
//

import Foundation

protocol Resourceable {
    associatedtype Resource: Codable
    
    var url: URL { get }
}
