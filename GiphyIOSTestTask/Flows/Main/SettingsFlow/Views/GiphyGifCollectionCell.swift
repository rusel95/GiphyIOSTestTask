//
//  GiphyGifCollectionViewCell.swift
//  GiphyIOSTestTask
//
//  Created by Ruslan Popesku on 3/26/19.
//  Copyright © 2019 Yalantis. All rights reserved.
//

import UIKit
import FLAnimatedImage
import SDWebImage

class GiphyGifCollectionCell: UICollectionViewCell, NibReusable {

    @IBOutlet private weak var gifImageView: FLAnimatedImageView!
    
    override func prepareForReuse() {
        gifImageView.animationImages = nil
        gifImageView.image = nil

        super.prepareForReuse()
    }
    
    func configure(url: URL?) {
        gifImageView.sd_setShowActivityIndicatorView(true)
        gifImageView.sd_setImage(with: url, completed: nil)
    }
}
