//
//  MainCell.swift
//  PowerWeatherApp
//
//  Created by Алексей on 14.05.2025.
//

import UIKit

final class MainCell: UITableViewCell {
    // MARK: – Cell ID
    static var id: String {
        String(describing: self)
    }
    
    // MARK: – UI Element's

    // MARK: – Initializate
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: – Configuration's
    private func configureView() {
        contentView.backgroundColor = .clear
    }
}
