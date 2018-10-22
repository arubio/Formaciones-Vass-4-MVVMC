//
//  SearchDetail.swift
//  Celestial-MVVM-C
//
//  Created by VASS on 16/10/2018.
//  Copyright © 2018 VASS. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

final class SearchDetail: BaseViewController<SearchDetailViewModel> {
    
    @IBOutlet weak var lbText: UILabel!
    
    override func bind() {
        viewModel.text
            .asObservable()
            .debug()
            .bind(to: lbText.rx.text)
            .disposed(by: disposeBag)
    }
}
