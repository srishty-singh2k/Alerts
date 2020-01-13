//
//  AlertsModel.swift
//  Alerts
//
//  Created by ksolves on 13/01/20.
//  Copyright © 2020 ksolves. All rights reserved.
//

import Foundation

struct AlertsModel: Codable {
    var status: Int?
    var msg: String?
    var result: Result?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case msg = "msg"
        case result = "result"
    }
}

struct Result: Codable {
    var notificationsCount: Int?
    var todayAlerts: [TodayAlerts]?
    var earlierAlerts: [EarlierAlerts]?
    
    enum CodingKeys: String, CodingKey {
        case notificationsCount = "notifications_count"
        case todayAlerts = "today_notification"
        case earlierAlerts = "earlier_notification"
    }
}

struct TodayAlerts: Codable {
    var notificationId: Int?
       var isRead: Int?
       var orderNo: String?
       var notificationType: String?
       var requestDate: String?
       
       enum CodingKeys: String, CodingKey {
           case notificationId = "notification_id"
           case isRead = "is_read"
           case orderNo = "order_no"
           case notificationType = "notification_type"
           case requestDate = "request_date"
       }
}

struct EarlierAlerts: Codable {
    var notificationId: Int?
    var isRead: Int?
    var orderNo: String?
    var notificationType: String?
    var requestDate: String?
    
    enum CodingKeys: String, CodingKey {
        case notificationId = "notification_id"
        case isRead = "is_read"
        case orderNo = "order_no"
        case notificationType = "notification_type"
        case requestDate = "request_date"
    }
}
