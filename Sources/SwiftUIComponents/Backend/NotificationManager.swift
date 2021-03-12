//
//  File.swift
//  
//
//  Created by Alessio Rubicini on 04/01/21.
//

import Foundation
import UserNotifications
import NotificationCenter

/// Allow to easily manage notifications with scheduling and deleting operations
public class NotificationManager {
    
    private let center = UNUserNotificationCenter.current()
    
    /// Schedule a notification in current notification center
    /// - Parameters:
    ///   - title: notification's title
    ///   - subtitle: notification's subtitle
    ///   - body: notification's body
    ///   - date: delivery date
    ///   - badge: badge number
    ///   - sound: notification's sound
    public func scheduleNotification(title: String, subtitle: String, body: String, date: Date, badge: UInt16, sound: UNNotificationSound) {
        
        // Ask for permission if necessary
        center.getNotificationSettings(completionHandler: { settings in
            
            if settings.authorizationStatus == .denied || settings.authorizationStatus == .notDetermined {
                self.center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                    }
                }
            }
        })
        
        // Create notification content
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.body = body
        content.badge = NSNumber(value: badge)
        content.sound = sound
        
        // Specify delivery conditions
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current
        dateComponents = Calendar.current.dateComponents([.hour, .minute, .day, .month, .year], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // Create the request
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        // Add request to notification center
        center.add(request)
    }
    
    
    public func removePendingNotification(identifier: UUID) {
        self.center.removePendingNotificationRequests(withIdentifiers: [identifier.uuidString])
    }
    
    
    public func removeDeliveredNotification(identifier: UUID) {
        self.center.removeDeliveredNotifications(withIdentifiers: [identifier.uuidString])
    }
    
    
    /// Check authorization of current notification center.
    /// - Returns: True if app is authorized, False if authorization is denied or not determined
    public func isAuthorized() -> Bool {
        
        var result: Bool = true
        
        // Ask for permission if necessary
        self.center.getNotificationSettings(completionHandler: { settings in
            
            if settings.authorizationStatus == .denied || settings.authorizationStatus == .notDetermined {
                result = false
            } else {
                result = true
            }
        })
        
        return result
    }
    
    
    /// Return the current notification center authorization status
    /// - Returns: authorization status as UNAuthorizationStatus type
    public func authorizationStatus() -> UNAuthorizationStatus {
        var result: UNAuthorizationStatus = .notDetermined
        
        // Ask for permission if necessary
        self.center.getNotificationSettings(completionHandler: { settings in
            
            result = settings.authorizationStatus
        })
        
        return result
    }
    
}



