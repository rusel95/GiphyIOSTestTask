//
//  GiphyCollectionViewModel.swift
//  GiphyIOSTestTask
//
//  Created by Ruslan Popesku on 3/26/19.
//  Copyright © 2019 Yalantis. All rights reserved.
//

import UIKit
import RxSwift
import HandyText

final class GiphyGifCollectionViewModel: HasDisposeBag {
    
    // MARK: Properies.
    
    var text: String {
        return L10n.commonButtonsOkButtonTitle
    }
    
    private let model: GiphyGifCollectionCellModel
    
    // MARK: Init.
    
    init(model: GiphyGifCollectionCellModel) {
        self.model = model
    }
    
}
