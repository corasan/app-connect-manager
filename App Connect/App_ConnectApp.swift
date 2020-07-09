//
//  App_ConnectApp.swift
//  App Connect
//
//  Created by Henry Paulino on 7/8/20.
//

import SwiftUI

@main
struct App_ConnectApp: App {
    @StateObject var api = AppConnectAPI()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(api)
        }
    }
}
