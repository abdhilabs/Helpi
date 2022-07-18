//
//  HelpiApp.swift
//  WatchHelpi WatchKit Extension
//
//  Created by Abdhi P (Work) on 14/07/22.
//

import SwiftUI

@main
struct HelpiApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
              ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
