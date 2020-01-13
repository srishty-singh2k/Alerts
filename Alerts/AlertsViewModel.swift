//
//  AlertsViewModel.swift
//  Alerts
//
//  Created by ksolves on 10/01/20.
//  Copyright © 2020 ksolves. All rights reserved.
//

import Foundation

class AlertsViewModel {
    var alertsModel = AlertsModel()
    var todayAlertArray = [TodayAlerts]()
    var earlierAlertArray = [EarlierAlerts]()
    var toDisplay: String {
        get{
            if alertsModel.result?.todayAlerts?.count == 0 && alertsModel.result?.earlierAlerts?.count == 0 {
                return "none"
            }else if alertsModel.result?.todayAlerts?.count == 0 {
                return "earlier"
            }else if alertsModel.result?.todayAlerts?.count == 0 {
                return "today"
            }else {
                return "both"
            }
        }
    }
    
    func getTodayAlert() -> [TodayAlerts] {
        guard let todayAlerts = alertsModel.result?.todayAlerts else { return []}
        return todayAlerts
    }
    
    func getEarlierAlert() -> [EarlierAlerts] {
        guard let earlierAlerts = alertsModel.result?.earlierAlerts else { return []}
        return earlierAlerts
    }
    
}
