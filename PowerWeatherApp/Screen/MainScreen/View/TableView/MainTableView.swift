//
//  TableView.swift
//  PowerWeatherApp
//
//  Created by Алексей on 14.05.2025.
//

import UIKit

final class MainTableView: UITableView {
    // MARK: – Initializate
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        configureView()
        registerCell()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: – Configuration's
    private func configureView() {
        backgroundColor = .tabeViewBackground
    }
    
    // MARK: – Register Cell
    private func registerCell() {
        register(MainCell.self, forCellReuseIdentifier: MainCell.id)
    }
}
