//
//  ContentView.swift
//  WatchHelpi WatchKit Extension
//
//  Created by Abdhi P (Work) on 14/07/22.
//

import SwiftUI
import HealthKit

struct ContentView: View {
  private var healthStore = HKHealthStore()
  let heartRateQuantity = HKUnit(from: "count/min")
  @State private var valueHeartRate = 0
  var connectivityHandler = WatchSessionManager.shared
  
  @State private var animationAmount = 1.0
  @State private var isShowNext = false
  
  var body: some View {
    
    NavigationView {
      NavigationLink(destination: CircleProgressView(), isActive: $isShowNext) {
        VStack(alignment: .leading){
          ZStack {
            Circle()
              .frame(width: 123, height: 123)
              .foregroundColor(Color(UIColor(red: 0.31, green: 0.06, blue: 0.01, alpha: 1.00)))
              .scaleEffect(animationAmount)
              .opacity(2 - animationAmount)
              .animation(Animation.easeOut(duration: 1)
                .repeatForever(autoreverses: false), value: animationAmount)
            
            Image("button")
              .resizable()
              .frame(width: 133, height: 133)
              .onTapGesture {
                isShowNext.toggle()
              }
          }
          HStack(){
            Text("❤️ \(valueHeartRate)")
              .font(.system(size: 20))
          }
        }
        .onAppear {
          animationAmount = 2
        }
      }
      .buttonStyle(PlainButtonStyle())
    }
    .onAppear {
      connectivityHandler.startSession()
    }
    .navigationBarHidden(true)
    .environment(\.rootPresentationMode, $isShowNext)
    .onAppear(perform: start)
  }
  
  func start() {
    autorizeHealthKit()
    startHeartRateQuery(quantityTypeIdentifier: .heartRate)
  }
  
  func autorizeHealthKit() {
    let healthKitTypes: Set = [
      HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!,
    ]
    
    healthStore.requestAuthorization(toShare: healthKitTypes, read: healthKitTypes) { _, _ in }
  }
  
  
  private func startHeartRateQuery(quantityTypeIdentifier: HKQuantityTypeIdentifier) {
    
    let devicePredicate = HKQuery.predicateForObjects(from: [HKDevice.local()])
    let updateHandler: (HKAnchoredObjectQuery, [HKSample]?, [HKDeletedObject]?, HKQueryAnchor?, Error?) -> Void = {
      query, samples, deletedObjects, queryAnchor, error in
      guard let samples = samples as? [HKQuantitySample] else {
        return
      }
      self.process(samples, type: quantityTypeIdentifier)
    }
    // 4
    let query = HKAnchoredObjectQuery(type: HKObjectType.quantityType(forIdentifier: quantityTypeIdentifier)!, predicate: devicePredicate, anchor: nil, limit: HKObjectQueryNoLimit, resultsHandler: updateHandler)
    
    query.updateHandler = updateHandler
    
    // 5
    
    healthStore.execute(query)
    
  }
  
  private func process(_ samples: [HKQuantitySample], type: HKQuantityTypeIdentifier) {
    var lastHeartRate = 0.0
    
    for sample in samples {
      if type == .heartRate {
        lastHeartRate = sample.quantity.doubleValue(for: heartRateQuantity)
      }
      self.valueHeartRate = Int(lastHeartRate)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
