//
//  HelpiApp.swift
//  WatchHelpi WatchKit Extension
//
//  Created by Abdhi P (Work) on 14/07/22.
//

import SwiftUI

@main
struct HelpiApp: App {
    
    @WKExtensionDelegateAdaptor(ExtentionDelegate.self) var delegate
    @SceneBuilder var body: some Scene {
        WindowGroup {
            if delegate.isFromComplication{
                 CircleProgressView()
            }else{
                ContentView()
                    .environment(\.appDelegate, delegate)
            }
        }
        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}

struct DelegateKey: EnvironmentKey{
    typealias Value = ExtentionDelegate
    static let defaultValue: ExtentionDelegate = ExtentionDelegate()
}

extension EnvironmentValues{
    var appDelegate:DelegateKey.Value{
        get{
            return self[DelegateKey.self]
        }
        set{
            self[DelegateKey.self] = newValue
        }
    }
}
