//
//  LocationService.swift
//  PowerWeatherApp
//
//  Created by Алексей on 15.05.2025.
//

import CoreLocation

final class LocationService: NSObject, LocationServiceProtocol {
    private let locationManager = CLLocationManager()
    private var completion: ((Result<String,Error>) -> ())?
    
    func requestLocation(completion: @escaping (Result<String, any Error>) -> ()) {
        self.completion = completion
        let status = locationManager.authorizationStatus
        
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            completion(.failure(LocationError.permissionDenied))
        @unknown default:
            completion(.failure(LocationError.unknow))
        }
    }
    
    // MARK: – Initializate
    override init() {
        super.init()
        self.locationManager.delegate = self
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            completion?(.failure(LocationError.noLocation))
            return
        }
        
        CLGeocoder().reverseGeocodeLocation(location) { [weak self] placemarks, error in
            guard let self else { return }
            if let error = error {
                self.completion?(.failure(error))
                return
            }
            
            guard let placemark = placemarks?.first else {
                self.completion?(.failure(LocationError.noPlacemark))
                return
            }
            
            guard let regionString = placemark.locality else {
                self.completion?(.failure(LocationError.unknow))
                return
            }
            
            self.completion?(.success(regionString))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        completion?(.failure(error))
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse || manager.authorizationStatus == .authorizedAlways {
            manager.requestLocation()
        } else if manager.authorizationStatus == .denied {
            completion?(.failure(LocationError.permissionDenied))
        }
    }
}
