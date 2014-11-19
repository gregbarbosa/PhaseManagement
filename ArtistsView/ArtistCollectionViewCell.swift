
//
//  ArtistCollectionViewCell.swift
//  Phase Management
//
//  Created by Greg Barbosa on 11/13/14.
//  Copyright (c) 2014 gregbarbosa. All rights reserved.
//

import UIKit

let imageHeight: CGFloat = 150.0
let offsetSpeed: CGFloat = 15.0

class ArtistCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var artistNameLabel: UILabel!

    var image: UIImage = UIImage() {
        didSet {
            imageView.image = image
        }
    }

    func offset(offset: CGPoint) {
        imageView.frame = CGRectOffset(self.imageView.bounds, offset.x, offset.y)
    }
}
