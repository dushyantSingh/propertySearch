//
//  DetailCellType.swift
//  PropertySearch
//
//  Created by Dushyant Singh on 27/10/21.
//

import UIKit

enum DetailCellType {
    case propertyImage(URL)
    case label(text: String, font: UIFont, textColor: UIColor)
    case height(CGFloat)
    case separator
    case titleLabel(title: String, text: String)
}

extension DetailCellType {
    var identifier: String {
        return "\(self.cell)"
    }
    var cell: UITableViewCell.Type {
        switch self {
        case .propertyImage:
            return ImageTableViewCell.self
        case .height:
            return SpacerTableViewCell.self
        case .label:
            return LabelTableViewCell.self
        case .separator:
            return SeparatorTableViewCell.self
        case .titleLabel:
            return TitleLabelTableViewCell.self
        }
    }
}
