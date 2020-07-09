//
//  MainView.swift
//  App Connect
//
//  Created by Henry Paulino on 7/9/20.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var api: AppConnectAPI
    @State var selected = 0
    var app: DeveloperApp
    
    var body: some View {
        VStack {
            TabBar(selected: $selected)
            Spacer()
            switch self.selected {
            case 0: BuildsView().background(Color.blue)
            case 1: BuildsView().background(Color.green)
            case 2: BuildsView().background(Color.pink)
            default:
                BuildsView().background(Color.red)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            api.selectAppId(id: app.id)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(app: DeveloperApp(id: "1", name: "Stocket", bundleId: "com.corasan.stocket"))
    }
}
