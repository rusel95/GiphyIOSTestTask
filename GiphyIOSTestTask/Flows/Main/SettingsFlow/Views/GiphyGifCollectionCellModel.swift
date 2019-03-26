//
//  GiphyGifCollectionCellModel.swift
//  GiphyIOSTestTask
//
//  Created by Ruslan Popesku on 3/26/19.
//  Copyright © 2019 Yalantis. All rights reserved.
//

import RxSwift
import RxCocoa
import Core

final class GiphyGifCollectionCellModel: HasDisposeBag {
    
    // MARK: - Properties
    let action = PublishSubject<String?>()
    
    // MARK: - Init
    
    init() {
        
    }
    
}
