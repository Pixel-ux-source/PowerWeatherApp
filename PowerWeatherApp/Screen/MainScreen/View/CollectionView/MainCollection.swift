//
//  CollectionView.swift
//  PowerWeatherApp
//
//  Created by Алексей on 14.05.2025.
//

import UIKit

final class MainCollection: UICollectionView {
    // MARK: – Initializate
    override init(frame: CGRect = .zero, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        registerCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: – Register Cell
    private func registerCell() {
        register(DayWeatherCell.self, forCellWithReuseIdentifier: DayWeatherCell.id)
        register(WeekWeatherCell.self, forCellWithReuseIdentifier: WeekWeatherCell.id)
    }
    
}

enum SectionMainCV: Int, CaseIterable {
    case dayWeather, weakWeather
}
