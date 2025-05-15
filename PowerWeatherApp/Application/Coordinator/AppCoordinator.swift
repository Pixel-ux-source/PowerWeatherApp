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
            vc.coordinator = self
            vc.view.backgroundColor = .whiteCustom
            self.navigationController.pushViewController(vc, animated: false)
        }
    }
}
