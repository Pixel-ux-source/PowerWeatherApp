//
//  ViewController.swift
//  PowerWeatherApp
//
//  Created by Алексей on 13.05.2025.
//

import UIKit
import SnapKit

class MainController: UIViewController {
    // MARK: – UI Element's
    private lazy var loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView(style: .medium)
        loader.color = .main
        loader.hidesWhenStopped = true
        return loader
    }()
    
    private lazy var loadingBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        view.isHidden = true
        return view
    }()
    
    // MARK: – Variables
    var presenter: MainPresenter!
    var coordinator: AppCoordinator!
    
    // MARK: – Instance's
    private let collectionView = MainCollection(collectionViewLayout: LayoutProvider.loadLayout())
    private let dataSource = MainDataSource()
    
    // MARK: – Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadLocation()
        configureCollectionView()
        setupLoader()
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
    
    // MARK: – Setup's
    private func setupLoader() {
        view.addSubviews(loader, loadingBackgroundView)
        
        loader.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        loadingBackgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
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
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: .cancel))
        
        present(alert, animated: true)
    }
    
    func showLocationDeniedAlert() {
        let alert = UIAlertController(title: "Геолокация отключена", message: "Чтобы мы могли показать вам погоду в вашем регионе, пожалуйста, разрешите доступ к геолокации в настройках", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Открыть настройки", style: .default, handler: { _ in
            if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(settingsURL)
            }
        }))
        alert.addAction(UIAlertAction(title: "Закрыть", style: .cancel, handler: nil))
        
        present(alert, animated: true)
    }
    
    func showRetryAlert(_ message: String, retryAction: @escaping () -> ()) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Повторить", style: .default, handler: { _ in
            retryAction()
        }))
        
        alert.addAction(UIAlertAction(title: "Закрыть", style: .cancel))
        
        present(alert, animated: true)
    }
    
    func showLoading() {
        loadingBackgroundView.isHidden = false
        loader.startAnimating()
        loader.isUserInteractionEnabled = false
    }
    
    func hideLoading() {
        loadingBackgroundView.isHidden = true
        loader.stopAnimating()
        loader.isUserInteractionEnabled = true
    }
}

