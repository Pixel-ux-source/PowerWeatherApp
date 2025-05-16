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
    private let urlApi = "https://api.weatherapi.com/v1/forecast.json"
    
    // MARK: – Get
    func getData<T: Decodable>(of type: T.Type, query: String, completion: @escaping(Result<T, Error>) ->()) {
        let param: Parameters = [
            "key":"fa8b3df74d4042b9aa7135114252304",
            "q": query,
            "days":"7"
        ]
        
        AF.request(urlApi, method: .get, parameters: param)
            .validate()
            .responseDecodable(of: T.self, queue: .global()) { response in
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
