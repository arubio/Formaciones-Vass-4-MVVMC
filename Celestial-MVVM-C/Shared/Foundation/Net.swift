//
//  Net.swift
//  Celestial-MVVM-C
//
//  Created by VASS on 04/10/2018.
//  Copyright © 2018 VASS. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol NetProtocol: class {
    func load<A: Resourceable>(_ resource: A) -> Single<A.Resource?>
}

final class Net: NetProtocol {
    private let session: URLSession
    private let jsonDecoder = JSONDecoder()
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func load<A: Resourceable>(_ resource: A) -> Single<A.Resource?> {
        let request = URLRequest(url: resource.url)
        return session.rx
            .data(request: request)
            .debug()
            .map { try self.jsonDecoder.decode(A.Resource.self, from: $0) }
            .catchErrorJustReturn(nil)
            .asSingle()
    }
}
