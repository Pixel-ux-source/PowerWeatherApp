//
//  CelsiumLabel.swift
//  PowerWeatherApp
//
//  Created by Алексей on 15.05.2025.
//

import UIKit

final class CelsiusLabel: UILabel {
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
        textColor = .main
        font = .systemFont(ofSize: 15, weight: .semibold)
        textAlignment = .center
        numberOfLines = 1
        setContentHuggingPriority(.required, for: .vertical)
    }
}

