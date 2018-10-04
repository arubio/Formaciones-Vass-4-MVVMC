//
//  Celestial_MVVM_CTests.swift
//  Celestial-MVVM-CTests
//
//  Created by VASS on 03/10/2018.
//  Copyright © 2018 VASS. All rights reserved.
//

import XCTest
import RxSwift

@testable import Celestial_MVVM_C

class SearchViewModelTests: XCTestCase, SearchNavigationActions, NetProtocol {
    var viewModel: SearchViewModel!
    let disposeBag = DisposeBag()

    var apiCallCounter = 0
    var keyStrokes: [String]!
    var keyStrokesDone: [String]!
    
    override func setUp() {
        viewModel = ServiceLocator.shared.searchViewModel(navigationDelegate: self, net: self)
        viewModel.viewDidLoad()

        
        keyStrokes = ["M", "Ma", "Mar", "Mars"]
        keyStrokesDone = []
        apiCallCounter = 0
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewModelAsksForDataOnKeyStroke() {
        beginTyping()
        
        viewModel.searchResults.subscribe(onNext: { results in
            if self.keyStrokes.count == 0 {
                XCTAssert(results.count == 100)
            } else {
                XCTAssert(results.count == 0)
            }
        })
        
        XCTAssert(apiCallCounter == keyStrokesDone.count)
    }
    
    func testKeystrokesUpdateViewModelSearchTerm() {
        beginTyping()
        
        viewModel.searchTerm
            .asObservable()
            .skipWhile { $0.isEmpty }
            .subscribe(onNext: { searchTerm in
                XCTAssert(self.keyStrokesDone.last! == searchTerm)
            }).disposed(by: disposeBag)
    }
    
    func testKeystrokesUpdateViewModelNavigationTitle() {
        beginTyping()
        
        viewModel.navigationTitle.subscribe(onNext: { newTitle in
            if self.keyStrokes.count == 4 {
                XCTAssert("SEARCH NASA" == newTitle)
            } else {
                XCTAssert(newTitle == "NASA SEARCH FOR: \(self.keyStrokesDone.last!)")
            }
        }).disposed(by: disposeBag)
    }
    
    // MARK: Private helpers
    
    private func beginTyping() {
        while keyStrokes.count != 0 {
            let keyStroke = keyStrokes.removeFirst()
            keyStrokesDone.append(keyStroke)
            viewModel.searchTerm.value = keyStroke
        }
    }
    
    // MARK: Navigation delegate

    func didSelect(_ item: SearchResultItem) {
        
    }
    
    // MARK: Net protocol
    
    func load<A>(_ resource: A) -> PrimitiveSequence<SingleTrait, Optional<A.Resource>> where A : Resourceable {
        
        switch resource {
        case is SearchResource:
            apiCallCounter += 1
            
            let jsonDecoder = JSONDecoder()
            if resource.url.absoluteString.contains("Mars") {
                let mappedData = try! jsonDecoder.decode(A.Resource.self, from: searchJSONResultForMars.data(using: .utf8)!)
                return Observable.just(mappedData).asSingle()
            } else { return Observable.just(nil).asSingle() }
            
        default: fatalError()
        }
    }
}
