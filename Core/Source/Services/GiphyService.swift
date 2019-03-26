//
//  GiphyService.swift
//  Core
//
//  Created by Ruslan Popesku on 3/26/19.
//  Copyright © 2019 Yalantis. All rights reserved.
//

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

import Foundation
import RxSwift
import RealmSwift
import GiphyCoreSDK

public final class GiphyService {
    
    private let disposeBag = DisposeBag()
    
    public init() {
 
    }
    
//    public func search(with query: String) -> Observable<String> {
//        
//        GiphyCore.shared.search(query) { (response, error) in
//            if let error = error as NSError? {
//                return Observable.error(error)
//            }
//            
//            if let response = response, let data = response.data, let pagination = response.pagination {
//                print(response.meta)
//                print(pagination)
//                for result in data {
//                    print(result)
//                }
//            } else {
//                print("No Results Found")
//            }
//        }
//    }
    
}
