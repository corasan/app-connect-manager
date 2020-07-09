//
//  AppConnectAPI.swift
//  App Connect
//
//  Created by Henry Paulino on 7/9/20.
//

import SwiftUI
import Alamofire

class AppConnectAPI: ObservableObject {
    @Published var apps: [DeveloperApp] = []

    private func get(_ endpoint: String, callback: @escaping (_ response: [String: Any]) -> Void) {
        let jwt = AppConnectAuthorization.getToken()
        let headers: HTTPHeaders = [
            .accept("application/json"),
            .authorization(bearerToken: jwt)
        ]
        AF.request("https://api.appstoreconnect.apple.com/v1/\(endpoint)", headers: headers).responseJSON { response in
            switch response.result {
            case let .success(result):
                let data = result as! [String: Any]
                callback(data)
            case let .failure(err):
                debugPrint("[AppConnectAPI] get(): \(err)")
            }
        }
    }
    
    func getApps() {
        get("apps") { res in
            for el in res["data"] as! [[String: Any]] {
                let attr = el["attributes"] as! [String: Any]
                let id = el["id"] as! String
                let apps = DeveloperApp(id: id, name: attr["name"] as! String, bundleId: attr["bundleId"] as! String)
                self.apps.append(apps)
            }
        }
    }
}

