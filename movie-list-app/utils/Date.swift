//
//  DateTimeHelper.swift
//  movie-list-app
//
//  Created by Mehta, Utkarsh on 05/11/24.
//

import Foundation

extension Date {
    func convertToYear() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.string(from: self)
    }
}
