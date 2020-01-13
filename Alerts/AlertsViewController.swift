//
//  AlertsViewController.swift
//  Alerts
//
//  Created by ksolves on 13/01/20.
//  Copyright © 2020 ksolves. All rights reserved.
//

import UIKit

class AlertsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var alertsTableView: UITableView!
    var alertsViewModel = AlertsViewModel()
    var todayAlertsArray = [TodayAlerts]()
    var earlierAlertsArray = [EarlierAlerts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertsTableView.delegate = self
        alertsTableView.dataSource = self
        alertsTableView.tableFooterView?.isHidden = true
        
        getAlerts()
        todayAlertsArray = alertsViewModel.getTodayAlert()
        earlierAlertsArray = alertsViewModel.getEarlierAlert()
        print("Array data set \n Today: \(todayAlertsArray) \n Earlier: \(earlierAlertsArray)")

        // Do any additional setup after loading the view.
    }
    
    func getAlerts() {
        AlertsManager.shared.getAlerts(completion: {(alert, error) in
            if error == nil {
                print("Saving data to model: \(alert) ")
                self.alertsViewModel.alertsModel = alert!
            }else {
                let alert = UIAlertController(title: "Alert", message: error, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
                self.present(alert, animated: true, completion: nil)
            }
        })
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if todayAlertsArray.count == 0 || earlierAlertsArray.count == 0 {
            return 1
        }
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.numberOfSections == 1 {
            if alertsViewModel.toDisplay == "today" {
                return todayAlertsArray.count
            }else if alertsViewModel.toDisplay == "earlier" {
                return earlierAlertsArray.count
            }
        }else {
            switch section {
            case 0: return todayAlertsArray.count
            case 1: return earlierAlertsArray.count
            default: return 0
            }
        }
        return 0
       }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView.numberOfSections == 1 {
            if alertsViewModel.toDisplay == "today" {
                return "Today"
            }else if alertsViewModel.toDisplay == "earlier" {
                return "Earlier"
            }
        }else {
            switch section {
            case 0: return "Today"
            case 1: return "Earlier"
            default: return ""
            }
        }
        return ""
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "alertsTableViewCell") as? AlertsTableViewCell else {
            fatalError("Dequeued cell is not an instance of AlertsTableViewCell")
        }
        
        if tableView.numberOfSections == 1 {
               if alertsViewModel.toDisplay == "today" {
                cell.textTitle.text = todayAlertsArray[indexPath.row].notificationType
               }else if alertsViewModel.toDisplay == "earlier" {
                cell.textTitle.text = earlierAlertsArray[indexPath.row].notificationType
               }
           }else {
            switch indexPath.section {
               case 0: cell.textTitle.text = todayAlertsArray[indexPath.row].notificationType
               case 1: cell.textTitle.text = earlierAlertsArray[indexPath.row].notificationType
            default: cell.textTitle.text = ""
               }
           }
        return cell
    }

}
