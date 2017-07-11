//
//  ViewController.swift
//  WeatherMadrid
//
//  Created by Lopez, Margaret on 29/6/17.
//  Copyright © 2017 Lopez, Margaret. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var currentWeatherTypeLable: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!

    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    
    var payMode: String!
    var newPayMode: String!
    var payModeButton: String!
    var newPayModeButton: String!
    var screen: String!
    var topButton: UIButton!
    var BottomButton: UIButton!
    

    var payModes = ["CIC": "Inmediato", "FMC": "Fin de Mes"]
    
    func validate() {
        if screen == "Payment" {
            if payMode == "CIC" {
                topButton.setTitle("INMEDIATO", for: .normal)
                newPayMode = "FMC"
                BottomButton.setTitle("FIN DE MES", for: .normal)
            } else {
                if payMode == "CRC" {
                    topButton.setTitle("INMEDIATO", for: .normal)
                    newPayMode = "CRF"
                    BottomButton.setTitle("FIN DE MES", for: .normal)
                }
            }
        }
    }

    @IBAction func oneclick(_ sender: Any) {
        
   
    }
    @IBAction func twoclick(_ sender: Any) {
        
    }
    
    
    let currentWeather = CurrentWeather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        currentWeather.donwloadDataWeather {
            self.updateMainUI()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    func updateMainUI() {
    
        self.dateLabel.text = currentWeather.date
        self.currentTempLabel.text = "\(currentWeather.currentTemp)"
        self.currentWeatherTypeLable.text = currentWeather.weatherType
        self.locationLabel.text = currentWeather.cityName
        self.currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
        
    }

}

