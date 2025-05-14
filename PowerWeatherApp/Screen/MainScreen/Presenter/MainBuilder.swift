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
        dataManager.loadData(of: Location.self) { model in
            DispatchQueue.main.async {
                let view = MainController()
                let presenter = MainPresenter(view: view, model: model)
                view.presenter = presenter
                view.dataManager = dataManager
                completion(view)
            }
        }
    }
}
