//
//  View.swift
//  PowerWeatherApp
//
//  Created by Алексей on 16.05.2025.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
