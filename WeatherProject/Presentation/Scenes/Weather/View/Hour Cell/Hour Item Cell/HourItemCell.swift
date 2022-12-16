//
//  HourItemCell.swift
//  Weather
//
//  Created by Tiko Janikashvili on 06.12.22.
//

import UIKit
import Kingfisher

class HourItemCell: UICollectionViewCell {
    
    // MARK: - Private IBOutlets
    @IBOutlet private weak var hourLabel: UILabel!
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var tempLabel: UILabel!
    
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with item: Hour) {
        hourLabel.text = "\(item.time.suffix(5))"
        tempLabel.text = "\(item.temp)º"
        label.text = item.condition.text
    }
}
