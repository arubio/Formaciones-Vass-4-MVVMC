//
//  SearchViewController.swift
//  Celestial-MVVM-C
//
//  Created by VASS on 04/10/2018.
//  Copyright © 2018 VASS. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift
import Kingfisher

private let cellIdent = "ResultCellIdentifier"

final class SearchViewController: BaseViewController<SearchViewModel> {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func configViews() {
        searchBar.placeholder = "Mars, Earth, Moon..."
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdent)
    }
    
    override func bind() {
        searchBar.rx.text
            .orEmpty
            .distinctUntilChanged()
            .throttle(0.5, scheduler: MainScheduler.instance)
            .asDriver(onErrorJustReturn: "")
            .drive(viewModel.searchTerm)
            .disposed(by: disposeBag)
        
        viewModel.searchResults
            .bind(to: tableView.rx.items(
                cellIdentifier: cellIdent,
                cellType: UITableViewCell.self)) {  row, element, cell in
                    cell.textLabel?.text = element.data.first?.title
                    cell.textLabel?.lineBreakMode = .byWordWrapping
                    cell.textLabel?.numberOfLines = 0
                }
            .disposed(by: disposeBag)
        
        tableView.rx
            .itemSelected
            .subscribe(onNext: { indexPath in
                self.viewModel.didSelectItem(at: indexPath.row)
            })
            .disposed(by: disposeBag)
        
        viewModel.navigationTitle
            .bind(to: rx.title)
            .disposed(by: disposeBag)
    }
}
