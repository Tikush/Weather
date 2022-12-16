//
//  WeatherDataSource.swift
//  Weather
//
//  Created by Tiko Janikashvili on 22.11.22.
//

import UIKit

class WeatherDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Private Properties
    private var tableView: UITableView!
    private var weatherManager: WeatherManagerProtocol!
    private var days: [Forecastday] = []
    
    init(with tableView: UITableView) {
        super.init()
        self.tableView = tableView
        self.tableView.dataSource = self
        setDays()
    }
    
    private func setDays() {
        weatherManager = WeatherApiManager()
        
        weatherManager.fetchDaysAndHours(with: EndPoint.url) { [weak self] forecastday in
            DispatchQueue.main.async {
                self?.days = forecastday
                self?.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if days.count == 0 {
            return 1
        } else {
            return days.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HourCell", for: indexPath)
            return cell
        }
        
        if indexPath.row > 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DayCell", for: indexPath) as? DayCell
            cell?.configure(with: days[indexPath.row])
            return cell!
        }
        
        let cell = UITableViewCell()
        return cell
    }
}
