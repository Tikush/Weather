//
//  DayCell.swift
//  WeatherProject
//
//  Created by Tiko Janikashvili on 14.12.22.
//

import UIKit

class DayCell: UITableViewCell {

    // MARK: - Private IBOutlets
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var minTempLabel: UILabel!
    @IBOutlet private weak var maxTempLabel: UILabel!
    
    // MARK: - Life Cyrcle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with item: Forecastday) {
        dateLabel.text = "\(item.date.suffix(2)) Dec"
        minTempLabel.text = "\(item.day.minTemp)"
        maxTempLabel.text = "\(item.day.maxTemp)"
    }
}
