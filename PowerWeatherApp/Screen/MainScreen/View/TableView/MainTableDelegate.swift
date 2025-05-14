//
//  MainTableDelegate.swift
//  PowerWeatherApp
//
//  Created by Алексей on 14.05.2025.
//

import UIKit

final class MainTableDelegate: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }
}
