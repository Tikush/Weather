//
//  WeatherViewController.swift
//  Weather
//
//  Created by Tiko Janikashvili on 22.11.22.
//

import UIKit

class WeatherViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var weatherLabel: UILabel!
    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    private var datasource: WeatherDataSource!
    private var weatherManager: WeatherManagerProtocol!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDataSource()
        registerCell()
        setCurrentWeather()
    }
    
    private func registerCell() {
        self.tableView.register(UINib(nibName: "DayCell", bundle: nil), forCellReuseIdentifier: "DayCell")
        self.tableView.register(UINib(nibName: "HourCell", bundle: nil), forCellReuseIdentifier: "HourCell")
    }
    
    private func configureDataSource() {
        datasource = WeatherDataSource(with: tableView)
    }
    
    private func setCurrentWeather() {
        weatherManager = WeatherApiManager()
        weatherManager.fetchCuttentWeather(with: EndPoint.url) { [weak self] weather in
            DispatchQueue.main.async {
                self?.tempLabel.text = "\(weather.current.temp)º"
                self?.weatherLabel.text = weather.current.condition.text
            }
        }
    }
}
