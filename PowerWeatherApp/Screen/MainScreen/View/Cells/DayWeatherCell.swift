//
//  MainCollectionCell.swift
//  PowerWeatherApp
//
//  Created by Алексей on 14.05.2025.
//

import UIKit
import SnapKit

final class DayWeatherCell: UICollectionViewCell {
    // MARK: – Cell ID
    static var id: String {
        String(describing: self)
    }
    
    // MARK: – UI Element's
    private lazy var timeLabel = SecondLabel()
    private lazy var celsiusLabel = CelsiusLabel()
    private lazy var weatherImageView = WeatherDayIcon()
    private lazy var labelStack = VStack(spacing: 10, distribution: .fillEqually, alignment: .center) { [self.timeLabel, self.celsiusLabel] }
    private lazy var iconStack = VStack(spacing: 20, distribution: .fillEqually, alignment: .center) { [self.labelStack, self.weatherImageView] }
    
    // MARK: – Inititalizate
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configureView()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: – Configuration's
    private func configureView() {
        contentView.backgroundColor = .whiteCustom
    }
    
    // MARK: – Setup's
    private func setupUI() {
        setupIconStack()
    }
    
    private func setupIconStack() {
        contentView.addSubview(iconStack)
        
        iconStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        weatherImageView.snp.makeConstraints { make in
            make.width.equalTo(weatherImageView.snp.height)
        }
    }
    
    // MARK: – Set UI
    func setUI(time: String, celsius: String) {
        DispatchQueue.main.async {
            self.timeLabel.text = time
            self.celsiusLabel.text = celsius
        }
    }
    
    // MARK: – Getter's
    func getIcon() -> WeatherDayIcon {
        return weatherImageView
    }
}
