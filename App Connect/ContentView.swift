//
//  ContentView.swift
//  App Connect
//
//  Created by Henry Paulino on 7/8/20.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var api: AppConnectAPI
    @State private var selection: String? = ""
    @State private var apps: [DeveloperApp] = []

    var body: some View {
        NavigationView {
            AppListView(selection: $selection, data: $apps)
            PlaceholderView()
        }
        .onChange(of: api.apps) { value in
            apps = value
        }
        .onAppear {
            api.getApps()
//            api.getAppInfo(id: "1500158254")
        }
        .frame(minWidth: 1200, minHeight: 800)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppConnectAPI())
    }
}
