//
//  BrowseViewModel.swift
//
//  Created by Ruslan Popesku on 11/29/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import GiphyCoreSDK

final class BrowseViewModel: HasDisposeBag {
    
    // MARK: - Properties.
    
    var giphsURLs: Observable<[URL?]> {
        return model.giphs.asObservable()
            .map { gifs -> [URL?] in
                return gifs.map { URL(string: $0.images?.downsized?.gifUrl ?? "") }
            }
    }
    
    var fetchOffset: BehaviorSubject<Int> {
        return model.fetchOffset
    }
    
    var fetchLimit: Int {
        return model.fetchLimit
    }
    
    let keywords = BehaviorRelay<String?>(value: nil)
    
    private let model: BrowseModel
    
    init(model: BrowseModel) {
        self.model = model
        initializeBindings()
    }
    
    private func initializeBindings() {
        keywords.bind(to: model.keywords).disposed(by: disposeBag)
    }
    
}
