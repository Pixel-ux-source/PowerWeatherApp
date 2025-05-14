//
//  ViewController.swift
//  PowerWeatherApp
//
//  Created by Алексей on 13.05.2025.
//

import UIKit

class MainController: UIViewController {
    // MARK: – Variables
    var dataManager: CoreDataManager!
    var presenter: MainPresenter!
    
    // MARK: – Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.showModel()
    }
    
}

extension MainController: MainViewProtocol {
    func setModel(_ model: [Location]) {
        
    }
}

