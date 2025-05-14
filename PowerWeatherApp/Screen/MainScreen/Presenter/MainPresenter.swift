//
//  MainPresenter.swift
//  PowerWeatherApp
//
//  Created by Алексей on 13.05.2025.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func showLocation(_ locations: [Location])
    func showError(_ message: String)
    func showLoading()
    func hideLoading()
}

protocol MainPresenterProtocol: AnyObject {
    func loadData()
}

final class MainPresenter: MainPresenterProtocol {
    private weak var view: MainViewProtocol?
    private let dataManager: CoreDataManager
    private let networkService: NetworkService
    private var model: [Location] = []
    
    init(view: MainViewProtocol, dataManager: CoreDataManager, networkService: NetworkService) {
        self.view = view
        self.dataManager = dataManager
        self.networkService = networkService
    }
    
    func loadData() {
        view?.showLoading()
        dataManager.loadData(of: Location.self) { [weak self] localData in
            guard let self else { return }
            if !localData.isEmpty {
                self.model = localData
                self.view?.hideLoading()
                self.view?.showLocation(localData)
            } else {
                networkService.getData(of: LocationDTO.self) { result in
                    switch result {
                    case .success(let dto):
                        self.dataManager.createData(from: dto) { result in
                            self.view?.hideLoading()
                            switch result {
                            case .success(let location):
                                self.model = [location]
                                self.view?.showLocation(self.model)
                            case .failure(let error):
                                self.view?.showError("Ошибка сохранения \(error.localizedDescription)")
                                print("Ошибка сохранения \(error.localizedDescription)")
                            }
                        }
                    case .failure(let error):
                        self.view?.hideLoading()
                        self.view?.showError("Ошибка загрузки \(error.localizedDescription)")
                        print("Ошибка загрузки \(error.localizedDescription)\nДетально: \(String(describing: error.asAFError))")
                    }
                }
            }
        }
        view?.hideLoading()
    }
}
