//
//  AppDelegate.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 2/9/2024.
//

import UIKit
import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  var notificationDelegate = NotificationDelegate()

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }

  func applicationDidFinishLaunching(_ application: UIApplication) {
    UNUserNotificationCenter.current().delegate = notificationDelegate
  }
}
