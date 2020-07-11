//
//  AppState.swift
//  App Connect
//
//  Created by Henry Paulino on 7/9/20.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var currentAppId: String = ""
    @Published var showSideMenu = false
    
    func toggleSideMenu(value: Bool) {
        showSideMenu.toggle()
        print(showSideMenu)
    }
}
