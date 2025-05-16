//
//  VertivalStack.swift
//  PowerWeatherApp
//
//  Created by Алексей on 15.05.2025.
//

import UIKit

final class VStack: UIStackView {
    // MARK: – Initializate
    init(frame: CGRect = .zero, spacing: CGFloat = 0, distribution: UIStackView.Distribution = .fill, alignment: UIStackView.Alignment = .fill, completion: @escaping () -> ([UIView])) {
        super.init(frame: frame)
        configure(spacing: spacing, distribution: distribution, alignment: alignment, views: completion())
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: – Configure
    private func configure(spacing: CGFloat, distribution: UIStackView.Distribution, alignment: UIStackView.Alignment, views: [UIView]) {
        axis = .vertical
        self.addArrangedSubviews(views)
        self.distribution = distribution
        self.spacing = spacing
        self.alignment = alignment
    }
}
