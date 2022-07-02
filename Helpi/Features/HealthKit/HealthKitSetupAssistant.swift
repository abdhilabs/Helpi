//
//  HealthKitSetupAssistant.swift
//  Helpi
//
//  Created by PUTRI RAHMADEWI on 28/06/22.
//


import HealthKit

//Cek apakah ada healthapp di device
class HealthKitSetupAssistant {
  
  private enum HealthkitSetupError: Error {
    case notAvailableOnDevice
    case dataTypeNotAvailable
  }
  
  class func authorizeHealthKit(completion: @escaping (Bool, Error?) -> Swift.Void) {
      
      //1. Check to see if HealthKit Is Available on this device
      guard HKHealthStore.isHealthDataAvailable() else {
        completion(false, HealthkitSetupError.notAvailableOnDevice)
        return
      }
      
      //2. Prepare the data types that will interact with HealthKit
      guard   let dateOfBirth = HKObjectType.characteristicType(forIdentifier: .dateOfBirth),
              let bloodType = HKObjectType.characteristicType(forIdentifier: .bloodType),
              let biologicalSex = HKObjectType.characteristicType(forIdentifier: .biologicalSex),
              let height = HKObjectType.quantityType(forIdentifier: .height),
              let bodyMass = HKObjectType.quantityType(forIdentifier: .bodyMass)
      else {
              
              completion(false, HealthkitSetupError.dataTypeNotAvailable)
              return
      }
      
      //3. Prepare a list of types you want HealthKit to read and write
          
      let healthKitTypesToRead: Set<HKObjectType> = [dateOfBirth,
                                                     bloodType,
                                                     biologicalSex,
                                                     height,
                                                     bodyMass,
                                                     HKObjectType.workoutType()]

      //4. Request Authorization
      HKHealthStore().requestAuthorization(toShare: nil,
                                           read: healthKitTypesToRead) { (success, error) in
        completion(success, error)
      }

      
      
    
  }
}
