//
//  AppCoordinator.swift
//  PowerWeatherApp
//
//  Created by Алексей on 13.05.2025.
//

import UIKit

final class AppCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    var dataManager: CoreDataManager
    
    init(dataManger: CoreDataManager, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.dataManager = dataManger
    }
    
    func start() {
        MainBuilder.build(dataManager: dataManager) { vc in
            vc.view.backgroundColor = .systemBackground
            self.navigationController.pushViewController(vc, animated: true)
        }
    }
}
