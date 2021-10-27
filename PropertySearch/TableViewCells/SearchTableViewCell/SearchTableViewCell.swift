//
//  SearchTableViewCell.swift
//  PropertySearch
//
//  Created by Dushyant Singh on 26/10/21.
//

import Foundation
import UIKit

class SearchTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var roomsLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var propertyImage: UIImageView!
    @IBOutlet weak var contentBackgroundView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        propertyImage.layer.cornerRadius = 5.0
        contentBackgroundView.layer.cornerRadius = 5.0
        contentBackgroundView.showShadow()
        titleLabel.font = .boldSystemFont(ofSize: 16)

        addressLabel.font = .systemFont(ofSize: 12)
        addressLabel.textColor = .gray

        descriptionLabel.font = .systemFont(ofSize: 12)
        descriptionLabel.textColor = .gray

        roomsLabel.font = .systemFont(ofSize: 14)
        roomsLabel.textColor = .gray

        amountLabel.font = .boldSystemFont(ofSize: 18)
        amountLabel.textColor = .darkText
    }

    func configure(item: Property) {
        titleLabel.text = item.projectName
        addressLabel.text = item.address!.streetName! + " . " + item.address!.district!
        roomsLabel.text = getRoomsString(item.attributes)
        descriptionLabel.text = getDescriptionLabel(category: item.category,
                                                    tenure: item.tenure,
                                                    completedAt: item.completedAt)
        if let urlString = item.photo,
           let url = URL(string: urlString) {
            propertyImage?.sd_setImage(with: url,
                                       placeholderImage: UIImage(named: "placeholder"))
        }
        if let price = item.attributes?.price {
            amountLabel.text = "$\(price)/mo"
        } else {
            amountLabel.text = ""
        }
    }

    private func getRoomsString(_ attributes: Attributes?) -> String {
        var roomsString = ""

        if let bedRooms = attributes?.bedrooms {
            roomsString = roomsString + "\(bedRooms) Beds"
        }

        if let bathrooms = attributes?.bathrooms {
            roomsString = roomsString.count > 0 ? roomsString + " . " : roomsString
            roomsString = roomsString + "\(bathrooms) Baths"
        }

        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        if let area = attributes?.areaSize,
        let size = nf.string(from: NSNumber(value: area)) {
            roomsString = roomsString.count > 0 ? roomsString + " . " : roomsString
            roomsString = roomsString + size + " sqft"
        }
        return roomsString
    }

    private func getDescriptionLabel(category: String?,
                             tenure: Int?,
                             completedAt: String?) -> String {
        var description = ""
        if let category = category {
            description = category
        }
        if let completedAt = completedAt {
            description = description.count > 0 ? description + " . " : description
            description = description + completedAt
        }
        if let tenure = tenure {
            description = description.count > 0 ? description + " . " : description
            description = description + "\(tenure) yrs"
        }
        return description
    }
}

extension UIView {
    func showShadow() {
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 6
        self.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}
