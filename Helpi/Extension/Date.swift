//
//  Date.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 22/08/22.
//

import Foundation

extension Date {
  func string(format: String = "yyyy-MM-dd") -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    dateFormatter.locale = Locale.init(identifier: "id")
    return dateFormatter.string(from: self)
  }
}
