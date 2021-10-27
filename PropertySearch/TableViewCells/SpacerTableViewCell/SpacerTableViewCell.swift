//
//  SpacerTableViewCell.swift
//  PropertySearch
//
//  Created by Dushyant Singh on 27/10/21.
//

import UIKit

class SpacerTableViewCell: DetailTableViewCell {
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!

    override func configure(_ cellType: DetailCellType) {
        if case let .height(value) = cellType {
            heightConstraint.constant = value
        }
    }
}
