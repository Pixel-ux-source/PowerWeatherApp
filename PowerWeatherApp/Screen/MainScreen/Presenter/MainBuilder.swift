//
//  MainBuilder.swift
//  PowerWeatherApp
//
//  Created by Алексей on 13.05.2025.
//

import UIKit

protocol MainBuilderProtocol: AnyObject {
    static func build(dataManager: CoreDataManager, completion: @escaping (MainController) -> ())
}

final class MainBuilder: MainBuilderProtocol {
    static func build(dataManager: CoreDataManager, completion: @escaping (MainController) -> ()) {
        let view = MainController()
        let networkService = NetworkService()
        let locationService = LocationService()
        let presenter = MainPresenter(view: view, dataManager: dataManager, networkService: networkService, locationService: locationService)
        view.presenter = presenter
        completion(view)
    }
}
