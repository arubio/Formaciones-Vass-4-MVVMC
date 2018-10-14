//
//  SearchViewController.swift
//  Celestial-MVVM-C
//
//  Created by VASS on 04/10/2018.
//  Copyright © 2018 VASS. All rights reserved.
//

import Foundation
import RxSwift

protocol SearchNavigationActions: class {
    func didSelect(_ item: SearchResultItem)
}

final class SearchViewModel: ViewModable {
    
    // MARK: Private properties
    
    private weak var coordinator: SearchNavigationActions?
    private let disposeBag = DisposeBag()
    private let netProvider: NetProtocol
    
    private var _searchResults = Variable<[SearchResultItem]>([])
    private var _navigationTitle = Variable<String>("")

    // MARK: Exposed streams to VC
    
    var searchTerm = Variable<String>("")
    var searchResults: Observable<[SearchResultItem]> {
        return _searchResults.asObservable()
    }
    
    var navigationTitle: Observable<String> {
        return _navigationTitle.asObservable()
    }
    
    init(coordinator: SearchNavigationActions, netProvider: NetProtocol) {
        self.coordinator = coordinator
        self.netProvider = netProvider
    }
    
    func viewDidLoad() {
       searchTerm
            .asObservable()
            .skipWhile { $0.isEmpty }
            .map(SearchResource.init(searchTerm:))
            .flatMap(netProvider.load)
            .map { $0?.collection.items ?? [] }
            .bind(to: _searchResults)
            .disposed(by: disposeBag)

        searchTerm
            .asObservable()
            .map { $0.isEmpty ? "SEARCH NASA" : "NASA SEARCH FOR: \($0)" }
            .bind(to: _navigationTitle)
            .disposed(by: disposeBag)
    }
    
    func didSelectItem(at index: Int) {
        
    }
}
