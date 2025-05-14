//
//  CoordinatorProtocol.swift
//  PowerWeatherApp
//
//  Created by Алексей on 13.05.2025.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    var navigationController: UINavigationController { get }
    
    func start()
}
