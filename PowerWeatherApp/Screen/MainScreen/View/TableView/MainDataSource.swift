//
//  MainDataSource.swift
//  PowerWeatherApp
//
//  Created by Алексей on 14.05.2025.
//

import UIKit

final class MainDataSource: NSObject, UITableViewDataSource {
    var model: [Location] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainCell.id, for: indexPath) as? MainCell else { fatalError("ERROR_DEQUEUE_MAIN_CELL") }
        
        return cell
    }
}
