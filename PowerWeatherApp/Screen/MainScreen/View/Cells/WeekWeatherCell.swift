//
//  WeekWeatherCell.swift
//  PowerWeatherApp
//
//  Created by Алексей on 14.05.2025.
//

import UIKit
import SnapKit

final class WeekWeatherCell: UICollectionViewCell {
    // MARK: – Cell ID
    static var id: String {
        String(describing: self)
    }
    
    // MARK: – UI Element's
    private lazy var dayLabel = DayLabel()
    private lazy var celsiusMaxLabel = CelsiusLabel()
    private lazy var weatherImageView = WeatherDayIcon()
    private lazy var celsiusMinLabel = SecondLabel()
    private lazy var hStack = HStack(spacing: 10) { [self.weatherImageView, self.celsiusMaxLabel, self.celsiusMinLabel] }
    private lazy var vStack = VStack(distribution: .fillEqually) { [self.dayLabel, self.hStack] }
    
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
        setupVStack()
    }
    
    private func setupVStack() {
        contentView.addSubview(vStack)

        vStack.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        weatherImageView.snp.makeConstraints { make in
            make.height.equalTo(weatherImageView.snp.width)
        }
    }
    
    // MARK: – Set UI
    func setUI(day: String, maxtemp: String, mintemp: String) {
        dayLabel.text = day
        celsiusMaxLabel.text = maxtemp
        celsiusMinLabel.text = mintemp
    }
    
    // MARK: – Getter
    func getIcon() -> WeatherDayIcon {
        return weatherImageView
    }
}
