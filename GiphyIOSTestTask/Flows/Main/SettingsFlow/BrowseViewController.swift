//
//  SettingsViewController.swift
//  BrainFlowTimer
//
//  Created by Ruslan Popesku on 11/29/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

final class BrowseViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet private weak var resultsCollectionView: UICollectionView!
    
    var viewModel: BrowseViewModel!
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeBindings()
    }
    
    // MARK: - Private Methods
    private func initializeBindings() {
        
    }
    
}

extension BrowseViewController: UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
}
