//
//  ViewController.swift
//  PowerWeatherApp
//
//  Created by Алексей on 13.05.2025.
//

import UIKit
import SnapKit

class MainController: UIViewController {
    // MARK: – Variables
    var presenter: MainPresenter!
    var coordinator: AppCoordinator!
    
    // MARK: – Instance's
    private let collectionView = MainCollection(collectionViewLayout: LayoutProvider.loadLayout())
    private let dataSource = MainDataSource()
    
    // MARK: – Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadData()
        configureCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigationBar()
    }
    
    // MARK: – Configuration's
    private func configureCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        collectionView.dataSource = dataSource
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let apperance = UINavigationBarAppearance()
        apperance.configureWithOpaqueBackground()
        apperance.backgroundColor = .whiteCustom
        
        apperance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 30, weight: .bold)
        ]
        
        navigationItem.standardAppearance = apperance
        navigationItem.scrollEdgeAppearance = apperance
        navigationItem.compactAppearance = apperance
    }
}

extension MainController: MainViewProtocol {
    func showCityName(_ cityName: String) {
        navigationItem.title = cityName
    }
    
    func showWeekWeather(_ weekWeather: [WeekWeatherModel]) {
        dataSource.weekWeatherModel = weekWeather
        collectionView.reloadData()
    }
    
    func showDayWeather(_ dayWeather: [HourWeatherModel]) {
        dataSource.dayWeatherModel = dayWeather
        collectionView.reloadData()
    }
    
    func showError(_ message: String) {
        // Покажем тут Alert с перезагрузкой
    }
    
    func showLoading() {
        // Через координатор открыть новый контроллер с загрузкой данных
    }
    
    func hideLoading() {
        // Через координатор закрыть новый контроллер с загрузкой данных
    }
}

