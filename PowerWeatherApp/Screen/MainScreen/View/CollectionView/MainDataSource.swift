//
//  MainCollectionDataSource.swift
//  PowerWeatherApp
//
//  Created by Алексей on 14.05.2025.
//

import UIKit
import SDWebImage

final class MainDataSource: NSObject, UICollectionViewDataSource {
    var dayWeatherModel: [HourWeatherModel] = []
    var weekWeatherModel: [WeekWeatherModel] = []
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        SectionMainCV.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch SectionMainCV(rawValue: section)! {
        case .dayWeather:
            return dayWeatherModel.count
        case .weakWeather:
            return weekWeatherModel.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch SectionMainCV(rawValue: indexPath.section)! {
        case .dayWeather:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayWeatherCell.id, for: indexPath) as? DayWeatherCell else { fatalError("DEQUEUE_DAY_WEATHER_CELL_FAILED") }
            
            let model = dayWeatherModel[indexPath.row]
            let time = model.time
            let celsius = model.temp
            cell.setUI(time: time, celsius: celsius)
            
            let url = model.icon
            let image = cell.getIcon()
            image.sd_setImage(with: url,
                              placeholderImage: UIImage(systemName: "arrow.trianglehead.2.clockwise.rotate.90.icloud.fill"),
                              context: nil)
            
            return cell

        case .weakWeather:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeekWeatherCell.id, for: indexPath) as? WeekWeatherCell else { fatalError("DEQUEUE_WEEK_WEATHER_CELL_FAILED") }
            let model = weekWeatherModel[indexPath.row]
            let day = model.date
            let maxTemp = model.maxTemp
            let minTemp = model.minTemp
            cell.setUI(day: day, maxtemp: maxTemp, mintemp: minTemp)
            
            let url = model.icon
            let image = cell.getIcon()
            image.sd_setImage(with: url,
                              placeholderImage: UIImage(systemName: "arrow.trianglehead.2.clockwise.rotate.90.icloud.fill"),
                              context: nil)
            return cell
        }
    }
}
