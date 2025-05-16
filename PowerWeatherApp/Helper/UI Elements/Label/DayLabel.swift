//
//  CelsiumLabel.swift
//  PowerWeatherApp
//
//  Created by Алексей on 15.05.2025.
//

import UIKit

final class DayLabel: UILabel {
    // MARK: – Initializate
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: – Configure
    private func configure() {
        textColor = .black
        font = .systemFont(ofSize: 15, weight: .semibold)
        textAlignment = .left
        numberOfLines = 1
        setContentHuggingPriority(.required, for: .vertical)
    }
}

