//
//  ViewController.swift
//  SimpleWeatherApp
//
//  Created by moonkey on 2023/02/28.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var minMaxTempView: UIView!
    
    var backgroundImageView: UIImageView?
    
    let weatherManager = WeatherManager.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupConfigureUI()
        assignbackground()
    }
    func assignbackground(){
        
        let image = UIImage(named: "Sunny")
        backgroundImageView = UIImageView(frame: view.bounds)
        backgroundImageView?.contentMode =  UIView.ContentMode.scaleAspectFill
        backgroundImageView?.clipsToBounds = true
        backgroundImageView?.image = image
        backgroundImageView?.center = view.center
        view.addSubview(backgroundImageView!)
        self.view.sendSubviewToBack(backgroundImageView!)
    }
    func setupConfigureUI(){
        countryLabel.text = "KR"
        regionLabel.text = "Seoul"
        currentTempLabel.text = "0\(WeatherAPI.celcius)"
        currentWeatherLabel.text = "Sunny"
        minTempLabel.text = "0\(WeatherAPI.celcius)"
        maxTempLabel.text = "0\(WeatherAPI.celcius)"
        
        descriptionView.clipsToBounds = true
        descriptionView.layer.cornerRadius = 5
        descriptionLabel.text = "Hello, Nice day."
        
        minMaxTempView.clipsToBounds = true
        minMaxTempView.layer.cornerRadius = 5
    }
    func setupData(){
        weatherManager.getWeatherInfo { [weak self] result in
            switch result {
            case .success(let weatherData):
                DispatchQueue.main.async { [weak self] in
                    self?.countryLabel.text = "\(weatherData.sys.country)"
                    self?.regionLabel.text = "\(weatherData.name)"
                    let currentTemp = round((weatherData.main.temp) - 273.15)
                    let minTemp = round((weatherData.main.tempMin) - 273.15)
                    let maxTemp = round((weatherData.main.tempMax) - 273.15)
                    self?.currentTempLabel.text = "\(Int(currentTemp))\(WeatherAPI.celcius)"
                    self?.minTempLabel.text = "\(Int(minTemp))\(WeatherAPI.celcius)"
                    self?.maxTempLabel.text = "\(Int(maxTemp))\(WeatherAPI.celcius)"
                    let currentWeather = weatherData.weather[0].main
                    self?.currentWeatherLabel.text = "\(currentWeather)"
                    self?.backgroundImageView?.image = UIImage(named: currentWeather)
                    self?.descriptionLabel.text = WeatherDescriptionAPI.calcDesc(mainDescription: currentWeather)
                }
                print("get weather data")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }


}

