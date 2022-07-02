//
//  HKBiologicalSex+StringRepresentation.swift
//  Helpi
//
//  Created by PUTRI RAHMADEWI on 28/06/22.
//

import HealthKit

extension HKBiologicalSex {
  
  var stringRepresentation: String {
    switch self {
    case .notSet: return "Unknown"
    case .female: return "Female"
    case .male: return "Male"
    case .other: return "Other"
    @unknown default:
        fatalError()
    }
  }
}
