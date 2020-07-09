//
//  ContentView.swift
//  App Connect
//
//  Created by Henry Paulino on 7/8/20.
//

import SwiftUI

import SwiftUI

struct DetailView: View {
    let text: String

    var body: some View {
        Text(text)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct ContentView: View {
    @EnvironmentObject var api: AppConnectAPI
    @State private var selection: String? = ""
    @State private var apps: [DeveloperApp] = []

    var body: some View {
        NavigationView {
            AppListView(selection: $selection, data: $apps)
//                .frame(minWidth: 250, minHeight: 400)
            DetailView(text: "Make a selection")
        }
        .onChange(of: api.apps) { value in
            apps = value
        }
        .onAppear {
            api.getApps()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppConnectAPI())
    }
}
