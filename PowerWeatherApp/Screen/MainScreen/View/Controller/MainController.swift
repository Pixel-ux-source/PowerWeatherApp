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
    private let tableView = MainTableView()
    private let dataSource = MainDataSource()
    private let tableDelegate = MainTableDelegate()
    private let networkService = NetworkService()
    
    // MARK: – Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadData()
        configureTableView()
    }
    
    // MARK: – Configuration's
    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableView.dataSource = dataSource
        tableView.delegate = tableDelegate
    }
    
}

extension MainController: MainViewProtocol {
    func showLocation(_ locations: [Location]) {
        dataSource.model = locations
        tableView.reloadData()
        print(dataSource.model)
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

