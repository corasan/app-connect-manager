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
    @State var apps = [DeveloperApp(id: "1", name: "Stocket", bundleId: "com.corasan.stocket"), DeveloperApp(id: "2", name: "CloudMate", bundleId: "com.corasan.cloudmate")]
    @State private var selection: String?

    var body: some View {
        NavigationView {
            AppListView(selection: $selection, data: $apps)
                .frame(minWidth: 200)
            DetailView(text: "Make a selection")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
