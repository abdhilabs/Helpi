//
//  String.swift
//  Helpi
//
//  Created by Abdhi P (Work) on 04/07/22.
//

import Foundation

extension String {
  func trimmingAllSpaces(using characterSet: CharacterSet = .whitespacesAndNewlines) -> String {
    return components(separatedBy: characterSet).joined()
  }
}
