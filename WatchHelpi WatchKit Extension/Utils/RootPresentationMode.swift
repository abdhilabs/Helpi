//
//  RootPresentationMode.swift
//  WatchHelpi WatchKit Extension
//
//  Created by Abdhi P (Work) on 18/07/22.
//

import SwiftUI

typealias RootPresentationMode = Bool

struct RootPresentationModeKey: EnvironmentKey {
  static let defaultValue: Binding<RootPresentationMode> = .constant(RootPresentationMode())
}

extension EnvironmentValues {
  var rootPresentationMode: Binding<RootPresentationMode> {
    get { return self[RootPresentationModeKey.self] }
    set { self[RootPresentationModeKey.self] = newValue }
  }
}

extension RootPresentationMode {
  public mutating func dismiss() {
    self.toggle()
  }
}
