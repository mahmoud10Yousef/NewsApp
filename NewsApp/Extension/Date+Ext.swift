//
//  Date+Ext.swift
//  NewsApp
//
//  Created by mahmoud yousef on 05/09/2022.
//

import Foundation
import Foundation

extension Date{
    
    func convertToMonthYearFormat() -> String{
        let dateFormatter        = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        
        return dateFormatter.string(from: self)
    }
}
