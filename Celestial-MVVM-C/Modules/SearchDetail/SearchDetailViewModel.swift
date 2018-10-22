//
//  SearchDetailViewModel.swift
//  Celestial-MVVM-C
//
//  Created by VASS on 16/10/2018.
//  Copyright © 2018 VASS. All rights reserved.
//

import Foundation
import RxSwift

final class SearchDetailViewModel: ViewModable {
    let text: ReplaySubject<String>
    
    init(text: String) {
        self.text = ReplaySubject<String>.create(bufferSize: 1)
        self.text.onNext(text)
    }
    
    func viewDidLoad() {
        
    }
}
