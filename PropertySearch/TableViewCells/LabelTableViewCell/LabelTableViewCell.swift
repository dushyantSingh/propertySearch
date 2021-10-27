//
//  LabelTableViewCell.swift
//  PropertySearch
//
//  Created by Dushyant Singh on 27/10/21.
//

import Foundation
import UIKit

class LabelTableViewCell: DetailTableViewCell {
    @IBOutlet weak var label: UILabel!

    override func configure(_ cellType: DetailCellType) {
        if case let .label(text, font, textColor) = cellType {
            label.text = text
            label.font = font
            label.textColor = textColor
        }
    }
}
