//
//  BrowseModel.swift
//
//  Created by Ruslan Popesku on 11/29/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import Foundation
import Core
import RxSwift
import RxCocoa
import RxOptional
import GiphyCoreSDK

final class BrowseModel: EventNode, HasDisposeBag {
    
    // MARK: - Properties.
    
    var giphs: BehaviorRelay<[GPHMedia]> = BehaviorRelay(value: [])
    
    let searchAction = PublishSubject<Void>()
    let keywords = BehaviorRelay<String?>(value: nil)
    let fetchLimit = 24
    let fetchOffset = BehaviorSubject<Int>(value: 0)
    
    // MARK: - Init.
    
    override init(parent: EventNode) {
        super.init(parent: parent)
        
        initializeBindings()
    }
    
    private func initializeBindings() {
        keywords.distinctUntilChanged()
            .doOnNext { [weak self] _ in
                self?.fetchOffset.onNext(0)
            }.disposed(by: disposeBag)
        
        fetchOffset
            .doOnNext { [weak self] offset in
                guard let self = self else { return }
                
                if let keywords = self.keywords.value {
                    self.getGifs(
                        query: keywords,
                        offset: offset,
                        giphsCompletionHandler: { [weak self] giphs in
                            if offset == 0 {
                                self?.giphs.accept(giphs)
                            } else {
                                self?.giphs.accept((self?.giphs.value ?? []) + giphs)
                            }
                        },
                        errorCompletionHandler: { (error) in
                            print(error)
                        }
                    )
                } else {
                    self.giphs.accept([])
                }
            }.disposed(by: disposeBag)
        
    }
    
    // MARK: - private
    
    public func getGifs(query: String,
                        offset: Int,
                        giphsCompletionHandler: @escaping ([GPHMedia]) -> Void,
                        errorCompletionHandler: @escaping (NSError) -> Void ) {
        GiphyCore.shared.search(
            query,
            media: GPHMediaType.gif,
            offset: offset,
            limit: fetchLimit,
            rating: GPHRatingType.unrated,
            lang: GPHLanguageType.russian
        ) { response, error in
            if let error = error as NSError? {
                errorCompletionHandler(error)
            }

            if let response = response, let giphs = response.data {
                giphsCompletionHandler(giphs)
            }
        }
    }
}
