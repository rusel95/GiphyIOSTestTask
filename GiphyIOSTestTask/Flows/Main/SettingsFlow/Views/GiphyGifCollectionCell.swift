//
//  GiphyGifCollectionViewCell.swift
//  GiphyIOSTestTask
//
//  Created by Ruslan Popesku on 3/26/19.
//  Copyright © 2019 Yalantis. All rights reserved.
//

import UIKit
//import SwiftyGif
//import GiphyCoreSDK
import FLAnimatedImage

class GiphyGifCollectionCell: UICollectionViewCell, NibReusable {

    @IBOutlet private weak var gifImageView: FLAnimatedImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        gifImageView.animatedImage = nil
    }
    
    func configure(url: URL?) {
//        if let url = url, let data = try? Data(contentsOf: url) {
//            let gifImage = FLAnimatedImage(animatedGIFData: data)
//            gifImageView.animatedImage = gifImage
//        }
    }
}
