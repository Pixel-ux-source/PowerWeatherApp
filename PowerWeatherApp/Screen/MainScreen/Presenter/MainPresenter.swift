//
//  MainPresenter.swift
//  PowerWeatherApp
//
//  Created by Алексей on 13.05.2025.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    func setModel(_ model: [Location])
}

protocol MainPresenterProtocol: AnyObject {
    var view: MainViewProtocol { get }
    var model: [Location] { get set }
    
    func showModel()
}

final class MainPresenter: MainPresenterProtocol {
    var view: MainViewProtocol
    var model: [Location]
    
    init(view: MainViewProtocol, model: [Location]) {
        self.view = view
        self.model = model
    }
    
    func showModel() {
        view.setModel(model)
    }
}
