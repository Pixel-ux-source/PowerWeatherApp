//
//  MainCollectionDataSource.swift
//  PowerWeatherApp
//
//  Created by Алексей on 14.05.2025.
//

import UIKit

final class MainDataSource: NSObject, UICollectionViewDataSource {
    var model: [Location] = []
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        SectionMainCV.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch SectionMainCV(rawValue: section)! {
        case .dayWeather:
            return model.count
        case .weakWeather:
            return model.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch SectionMainCV(rawValue: indexPath.section)! {
        case .dayWeather:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayWeatherCell.id, for: indexPath) as? DayWeatherCell else { fatalError("DEQUEUE_DAY_WEATHER_CELL_FAILED") }
            cell.setUI(time: "12:00", celsius: "20")
            
            let image = cell.getIcon()
            return cell

        case .weakWeather:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeekWeatherCell.id, for: indexPath) as? WeekWeatherCell else { fatalError("DEQUEUE_WEEK_WEATHER_CELL_FAILED") }
            
            return cell
        }
        
    }
    
    
}
