//
//  SettingsViewModel.swift
//  BrainFlowTimer
//
//  Created by Ruslan Popesku on 11/29/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import Foundation
import RxSwift

final class BrowseViewModel: HasDisposeBag {
    
    private let model: BrowseModel
    
    init(model: BrowseModel) {
        self.model = model
        initializeBindings()
    }
    
    private func initializeBindings() {
        
    }
    
}
