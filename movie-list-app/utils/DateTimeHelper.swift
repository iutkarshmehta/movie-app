//
//  DateTimeHelper.swift
//  movie-list-app
//
//  Created by Mehta, Utkarsh on 05/11/24.
//

 import Foundation

 class DateTimeHelper {
    func convertToYear (dateString: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        guard let newDate = inputFormatter.date(from: dateString) else {
            return nil
        }
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "yyyy"
        return outputFormatter.string(from: newDate)
    }
 }
