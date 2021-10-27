//
//  TitleLabelTableViewCell.swift
//  PropertySearch
//
//  Created by Dushyant Singh on 27/10/21.
//

import UIKit

class TitleLabelTableViewCell: DetailTableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    override func configure(_ cellType: DetailCellType) {
        if case let .titleLabel(title, text) = cellType {
            titleLabel.text = title
            label.text = text
        }
    }
}
private extension TitleLabelTableViewCell {
    func setupUI() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 16)
    }
}
