//
//  HKBloodType+StringRepresentation.swift
//  Helpi
//
//  Created by PUTRI RAHMADEWI on 28/06/22.
//
import HealthKit

extension HKBloodType {
  
  var stringRepresentation: String {
    switch self {
    case .notSet: return "Unknown"
    case .aPositive: return "A+"
    case .aNegative: return "A-"
    case .bPositive: return "B+"
    case .bNegative: return "B-"
    case .abPositive: return "AB+"
    case .abNegative: return "AB-"
    case .oPositive: return "O+"
    case .oNegative: return "O-"
    @unknown default:
        fatalError()
    }
}
}
