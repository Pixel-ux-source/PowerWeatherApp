//
//  StackVIew.swift
//  PowerWeatherApp
//
//  Created by Алексей on 15.05.2025.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
