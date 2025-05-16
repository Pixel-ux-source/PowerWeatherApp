//
//  Location.swift
//  PowerWeatherApp
//
//  Created by Алексей on 15.05.2025.
//

import CoreLocation

protocol LocationServiceProtocol {
    func requestLocation(completion: @escaping (Result<String, Error>) -> ())
}

enum LocationError: Error, LocalizedError {
    case permissionDenied
    case noLocation
    case noPlacemark
    case unknow
    
    var errorDescription: String? {
        switch self {
        case .permissionDenied:
            return "Доступ к геолокации запрещён"
        case .noLocation:
            return "Не удалось получить координаты"
        case .noPlacemark:
            return "Не удалось определить адрес"
        case .unknow:
            return "Неизвестная ошибка"
        }
    }
}
