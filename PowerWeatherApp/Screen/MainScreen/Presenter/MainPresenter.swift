//
//  MainPresenter.swift
//  PowerWeatherApp
//
//  Created by Алексей on 13.05.2025.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func showDayWeather(_ dayWeather: [HourWeatherModel])
    func showWeekWeather(_ weekWeather: [WeekWeatherModel])
    func showCityName(_ cityName: String)
    
    func showError(_ message: String)
    func showLocationDeniedAlert()
    func showRetryAlert(_ message: String, retryAction: @escaping () -> ())
    
    func showLoading()
    func hideLoading()
}

protocol MainPresenterProtocol: AnyObject {
    func loadLocation()
    var dayWeatherModels: [HourWeatherModel] { get }
    var cityName: String { get }
}

final class MainPresenter: MainPresenterProtocol {
    private(set) var dayWeatherModels: [HourWeatherModel] = []
    private(set) var weekWeatherModels: [WeekWeatherModel] = []
    private(set) var cityName: String = "Москва"
    
    private weak var view: MainViewProtocol?
    
    private let dataManager: CoreDataManager
    private let networkService: NetworkService
    private let locationService: LocationService
    
    init(view: MainViewProtocol, dataManager: CoreDataManager, networkService: NetworkService, locationService: LocationService) {
        self.view = view
        self.dataManager = dataManager
        self.networkService = networkService
        self.locationService = locationService
    }
    
    // MARK: – Fetch From Server
    private func fetchFromServer(query: String) {
        networkService.getData(of: LocationDTO.self, query: query) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let dto):
                self.dataManager.createData(from: dto) { result in
                    self.view?.hideLoading()
                    switch result {
                    case .success(let location):
                        self.updateModels(with: [location])
                    case .failure(let error):
                        self.view?.showError("Ошибка сохранения")
                        print("Ошибка сохранения \(error.localizedDescription)")
                    }
                }
            case .failure(let error):
                self.view?.hideLoading()
                self.view?.showRetryAlert("Ошибка загрузки данных", retryAction: {
                    self.view?.showLoading()
                    self.fetchFromServer(query: query)
                })
                print("Ошибка загрузки \(error.localizedDescription)\nДетально: \(String(describing: error.asAFError))\n")
            }
        }
    }
    
    // MARK: – Load Data
    private func loadData(city: String) {
        self.dataManager.loadData(of: Location.self) { localData in
            self.view?.showLoading()
            self.cityName = city
            if !localData.isEmpty {
                self.updateModels(with: localData)
                self.view?.hideLoading()
            } else {
                self.fetchFromServer(query: city)
            }
        }
    }
    
    // MARK: – Load Location
    func loadLocation() {
        locationService.requestLocation { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let city):
                loadData(city: city)
            case .failure(let error):
                self.handleLocationError(error)
                print("Ошибка получения геолокации: \(error.localizedDescription)")
            }
        }
    }
    
    private func handleLocationError(_ error: Error) {
        if let locationError = error as? LocationError {
            switch locationError {
            case .noLocation, .noPlacemark:
                view?.showError("Не удалось определить местоположение")
            case .permissionDenied:
                view?.showLocationDeniedAlert()
                loadData(city: cityName)
            case .unknow:
                view?.showError("Произошла неизвестная ошибка при определении местоположения")
            }
        } else {
            self.view?.showError("Ошибка геолокации: \(error.localizedDescription)")
        }
    }
    
    // MARK: – Update Model Location
    private func updateModels(with locations: [Location]) {
        view?.showCityName(cityName)
        
        if let hourWeather = self.extractFirstHourWeather(from: locations) {
            self.dayWeatherModels = hourWeather.map(HourWeatherModel.init)
            self.view?.showDayWeather(self.dayWeatherModels)
        }
        
        if let weather = self.extractDayForWeather(from: locations ) {
            self.weekWeatherModels = weather.map(WeekWeatherModel.init)
            self.view?.showWeekWeather(self.weekWeatherModels)
        }
    }
    
    // MARK: – Extract HourWeather
    private func extractFirstHourWeather(from location: [Location]) -> [HourWeather]? {
        guard let weatherSet = location.first?.weather as? Set<Weather>,
              let weather = weatherSet.sorted(by: { $0.date ?? "" < $1.date ?? "" }).first,
              let hourWeather = weather.hourWeather as? Set<HourWeather> else { return nil }
        return Array(hourWeather).sorted { $0.timeEpoch < $1.timeEpoch }
    }
    
    // MARK: – Extract Week Day for Weather
    private func extractDayForWeather(from location: [Location]) -> [Weather]? {
        guard let weather = location.first?.weather as? Set<Weather> else { return nil }
        return Array(weather).sorted(by: { $0.date ?? "" < $1.date ?? "" })
    }
}
