//
//  HourCell.swift
//  Weather
//
//  Created by Tiko Janikashvili on 05.12.22.
//

import UIKit

class HourCell: UITableViewCell {
    
    // MARK: - Private IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK: - Private Properties
    private var hours: [Hour] = []
    private var weather: WeatherManagerProtocol!
    
    // MARK: - Life Cyrcle
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        setHours()
    }
    
    private func setup() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.layer.cornerRadius = 10
        collectionView.register(UINib(nibName: "HourItemCell", bundle: nil), forCellWithReuseIdentifier: "HourItemCell")
    }
    
    private func setHours() {
        weather = WeatherApiManager()
        
        weather.fetchDaysAndHours(with: EndPoint.url) { [weak self] forecastday in
            DispatchQueue.main.async {
                forecastday.forEach {
                    self?.hours = $0.hour
                }
                self?.collectionView.reloadData()
            }
        }
    }
}

extension HourCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        hours.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HourItemCell", for: indexPath) as? HourItemCell
        cell?.configure(with: hours[indexPath.row])
        return cell!
    }
}

extension HourCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}
