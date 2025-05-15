//
//  WeekWeatherCell.swift
//  PowerWeatherApp
//
//  Created by Алексей on 14.05.2025.
//

import UIKit

final class WeekWeatherCell: UICollectionViewCell {
    // MARK: – Cell ID
    static var id: String {
        String(describing: self)
    }
    
    // MARK: – Inititalizate
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
