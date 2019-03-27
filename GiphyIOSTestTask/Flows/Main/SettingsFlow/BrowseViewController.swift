//
//  BrowseViewController
//
//  Created by Ruslan Popesku on 11/29/18.
//  Copyright © 2018 Yalantis. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit

final class BrowseViewController: UIViewController, UICollectionViewDelegate {

    // MARK: - Properties
    
    @IBOutlet private weak var searchField: UITextField!
    @IBOutlet private weak var resultsCollectionView: UICollectionView!
    
    var viewModel: BrowseViewModel!
    
    private var refreshControl = UIRefreshControl()
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeBindings()
        setupUI()
    }
    
    // MARK: - Private Methods
    private func initializeBindings() {
        searchField.rx.controlEvent(.editingChanged)
            .withLatestFrom(searchField.rx.text)
            .bind(to: viewModel.keywords)
            .disposed(by: disposeBag)
        
        searchField.rx.controlEvent(.editingDidEndOnExit)
            .doOnNext { [weak self]  _ in
                self?.searchField.resignFirstResponder()
            }.disposed(by: disposeBag)
        
        refreshControl.rx.controlEvent(.valueChanged)
            .doOnNext { [weak self] _ in
                if self?.refreshControl.isRefreshing == true {
                    self?.viewModel.fetchOffset.onNext(0)
                }
            }.disposed(by: disposeBag)
        
        viewModel.giphsURLs
            .bind(to:
                resultsCollectionView.rx.items(
                    cellIdentifier: GiphyGifCollectionCell.reuseIdentifier,
                    cellType: GiphyGifCollectionCell.self
                )
            ) { _, url, cell in
                cell.configure(url: url)
            }.disposed(by: disposeBag)
        
        viewModel.giphsURLs.distinctUntilChanged()
            .doOnNext { [weak self] _ in
                DispatchQueue.main.async {
                    self?.refreshControl.endRefreshing()
                }
            }.disposed(by: disposeBag)

        resultsCollectionView.rx.willDisplayCell
            .map { _, path -> Int in
                return path.item
            }
            .withLatestFrom(viewModel.fetchOffset) { ($0, $1) }
            .map { [weak viewModel] row, offset -> Int? in
                if row >= offset - 1 {
                    return offset + (viewModel?.fetchLimit ?? 0)
                } else {
                    return nil
                }
            }
            .filterNil()
            .bind(to: viewModel.fetchOffset)
            .disposed(by: disposeBag)
    }
    
    private func setupUI() {
        resultsCollectionView.refreshControl = refreshControl
        
        guard let layout = resultsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        let cellsInRowCount = 3
        let interitemSpacing: CGFloat = 10
        let topInset = searchField.frame.height + 40.0
        let inset = UIEdgeInsets(top: topInset, left: 20, bottom: 20, right: 20)
        
        let cellSize = (resultsCollectionView.frame.size.width - interitemSpacing * CGFloat(cellsInRowCount - 1)
            - inset.left - inset.right) / CGFloat(cellsInRowCount)
        layout.itemSize = CGSize(width: cellSize, height: cellSize)
        layout.sectionInset = inset
        // - 1 to fit size
        layout.minimumLineSpacing = interitemSpacing - 1
        layout.minimumInteritemSpacing = interitemSpacing - 1
    }
    
}
