//
//  NetworkService.swift
//  PowerWeatherApp
//
//  Created by Алексей on 13.05.2025.
//

import UIKit
import Alamofire

final class NetworkService {
    // MARK: – Settings URL
    private let urlApi = "http://api.weatherapi.com/v1/forecast.json"
    private let param: Parameters = [
        "key":"fa8b3df74d4042b9aa7135114252304",
        "q":"MOSKVA",
        "days":"7"
    ]
    
    // MARK: – Get
    func getData(completion: @escaping(Result<LocationDTO, Error>) ->()) {
        AF.request(urlApi, method: .get, parameters: param)
            .validate()
            .responseDecodable(of: LocationDTO.self, queue: .global()) { response in
                switch response.result {
                case .success(let data):
                    DispatchQueue.main.async {
                        completion(.success(data))
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                }
            }
    }
}
