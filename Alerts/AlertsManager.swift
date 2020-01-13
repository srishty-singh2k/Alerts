//
//  AlertsManager.swift
//  Alerts
//
//  Created by ksolves on 10/01/20.
//  Copyright © 2020 ksolves. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class AlertsManager {
    
    let user_id = "6"
    static let shared: AlertsManager = {
        let instance = AlertsManager()
        return instance
    }()
    
    func getAlerts(completion: @escaping(AlertsModel?, String?) -> ()) {
        
        let getAlertsURL = "https://api.develop-promotixapp.tk/api/v1/mobile/get_notifications?user_id="+self.user_id
        let header = ["Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImU2NGJkMzg4YzdkYWNlODY4MDFjNzdmNzUwZTc2ZTlmMDM1NDQzOTU1Y2FmODBjN2ZhNjNiZTJlM2IxNzUxZDQ2YzYzMDczMDc4MzRmNTUwIn0.eyJhdWQiOiIxIiwianRpIjoiZTY0YmQzODhjN2RhY2U4NjgwMWM3N2Y3NTBlNzZlOWYwMzU0NDM5NTVjYWY4MGM3ZmE2M2JlMmUzYjE3NTFkNDZjNjMwNzMwNzgzNGY1NTAiLCJpYXQiOjE1Nzg5MTMzMzUsIm5iZiI6MTU3ODkxMzMzNSwiZXhwIjoxNjEwNTM1NzM1LCJzdWIiOiI2Iiwic2NvcGVzIjpbXX0.IJm-6uZV_RUF-qHprmu9Vc_7sPfMaqBmm8woUxQj8mB8J3znwdtKDVwqhjYZ9y7z0aCECQog0ByMsuhH4W4zCLF6j7E2RzTEDdM8IRd0GhFCVq3VmCBNNqcD_EgeMgHOJaOIDL4MDLb3wz45LN6n5vfT318XCuk3zLa3Mx-kA2OCZRpwh6CvWj6hGbWilUSibMYFlnkxkPUlHK0n3dIsrRQ6Uts7XwTLPRhE1sSTj7bosDUDQDeB_bYWIL7s_ggM5QkMAib0zXCK77qXTUWIfe60xFKpR9QGdvOq32bgBko8EpiKxa2SashoY0EMowRGUCp72SZUn6BUKXHiAXzF7aMwHKb3ho38FFmByhcyW3XM8VbCxkx2zW8yn-KOo-knLoFxFZ983FUoAPMP6ef_QkJSWL5O5e5HRpRRfvVSySB6K1h03h4vZNc6hjI_Uic3tV3ExmaYMj1hzqMEzEBv8lfuTJv_3RuVvAeb5FnB7Qp4-CuxWwA43ayja3uK5JxmP81tUeiJ15GwfF7O5Mzi3Fil_9SSuRBFL20Y9pwOFMLs8uZ8djM6Yoi2Jog8Vqsf2V3JEnml6ZTLlhN7NAIpA-03JIBo7SBBvCPYkgQp_IWlwhgOj_k_GqjXkPyKhIPbCuGIL6xXELTsHlyvrvdJt-2ZttqakgF96hBOKf0_Z-o"]
        print("API called")
        Alamofire.request(getAlertsURL, method: .get, parameters: nil, headers: header).responseJSON {response in
            switch response.result {
                
            case .success:
                do {
                    print("API succeeded")
                    let alert = try JSONDecoder().decode(AlertsModel?.self, from: response.data!)
                  
                    if  alert?.status == 200{
                        completion(alert, nil)
                    }
                    else if alert?.status ?? 400 > 200{
                        completion(alert, alert?.msg)
                    }
                }catch {
                    print("API failed")
                    completion(nil, error.localizedDescription)
                }
           
            case .failure(let error):
                print("============ Here ============")
                print(String(data: response.data!, encoding: String.Encoding.utf8))
                print(error)
                completion(nil, error.localizedDescription)
            }
        }
    }
}
