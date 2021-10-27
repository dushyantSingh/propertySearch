//
//  ImageTableViewCell.swift
//  PropertySearch
//
//  Created by Dushyant Singh on 27/10/21.
//

import Foundation
import UIKit

class ImageTableViewCell: DetailTableViewCell {
    @IBOutlet weak var propertyImage: UIImageView!

    override func configure(_ cellType: DetailCellType) {
        if case let .propertyImage(url) = cellType {
            propertyImage.sd_setImage(with: url,
                                      placeholderImage: UIImage(named: "placeholder"))
        }
    }
}
