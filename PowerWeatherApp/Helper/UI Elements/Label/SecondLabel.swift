//
//  TimeLabel.swift
//  PowerWeatherApp
//
//  Created by Алексей on 15.05.2025.
//

import UIKit

final class SecondLabel: UILabel {
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
        textColor = .second
        font = .systemFont(ofSize: 12, weight: .medium)
        textAlignment = .center
        numberOfLines = 1
        setContentHuggingPriority(.required, for: .vertical)
    }
}

