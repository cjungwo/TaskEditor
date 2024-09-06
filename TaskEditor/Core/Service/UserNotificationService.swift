//
//  UserNotificationService.swift
//  TaskEditor
//
//  Created by JungWoo Choi on 4/9/2024.
//

import UserNotifications

struct UserNotificationService {
  func sendNotification() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, _ in
      if granted {
        let content = UNMutableNotificationContent()
        content.title = "Stop Timer"
        content.body = "Stop setting timer"
        content.sound = UNNotificationSound.default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        let request = UNNotificationRequest(
          identifier: UUID().uuidString,
          content: content,
          trigger: trigger
        )

        UNUserNotificationCenter.current().add(request)
      }
    }
  }
}

class NotificationDelegate: NSObject, UNUserNotificationCenterDelegate {
  func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    willPresent notification: UNNotification,
    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
  ) {
    completionHandler([.banner, .sound])
  }
}

