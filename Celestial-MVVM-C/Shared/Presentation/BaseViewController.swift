//
//  BaseViewController.swift
//  Celestial-MVVM-C
//
//  Created by VASS on 04/10/2018.
//  Copyright © 2018 VASS. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class BaseViewController<ViewModel: ViewModable>: UIViewController {
    let viewModel: ViewModel
    let disposeBag = DisposeBag()
    
    required init(viewModel: ViewModel, nibName: String? = nil, bundle: Bundle? = nil) {
        self.viewModel = viewModel
        
        super.init(nibName: nibName, bundle: bundle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        configViews()
        
        viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.viewWillAppear()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        viewModel.viewWillLayoutSubviews()
    }
    
    func bind() {
        
    }
    
    func configViews() {
        
    }
}
