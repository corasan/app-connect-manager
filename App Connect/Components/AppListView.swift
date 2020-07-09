//
//  AppListView.swift
//  App Connect
//
//  Created by Henry Paulino on 7/8/20.
//

import SwiftUI

struct AppListView: View {
    @Binding var selection: String?
    @Binding var data: [DeveloperApp]
    @EnvironmentObject var api: AppConnectAPI
    
    var body: some View {
        List(selection: $selection) {
            ForEach(data) { item in
                NavigationLink(destination: MainView(app: item)) {
                    HStack {
                        Rectangle()
                            .frame(width: 42, height: 42)
                            .cornerRadius(6)
                        Text(item.name)
                            .font(.system(size: 20, weight: .semibold))
                            .padding(.leading, 5)
                    }
                    .padding(.vertical, 12)
                }
                .id(UUID().uuidString)
            }
        }
        .listStyle(SidebarListStyle())
        .frame(minWidth: 250)
        .padding(.top, 10)
    }
}

struct AppListView_Previews: PreviewProvider {
    @State static var selection: String?
    @State static var data = [DeveloperApp(id: "1", name: "Stocket", bundleId: "com.corasan.stocket"), DeveloperApp(id: "2", name: "Stocket", bundleId: "com.corasan.stocket")]

    static var previews: some View {
        AppListView(selection: $selection, data: $data)
            .preferredColorScheme(.light)
    }
}
