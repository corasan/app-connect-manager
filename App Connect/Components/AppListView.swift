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
    

    var body: some View {
        List(selection: $selection) {
            ForEach(data) { item in
                NavigationLink(destination: DetailView(text: item.name)) {
                    HStack {
                        Rectangle()
                            .frame(width: 45, height: 45)
                            .cornerRadius(6)
                        Text(item.name)
                            .font(.system(size: 22, weight: .bold))
                            .padding(.leading, 5)
                    }
                }.padding(.vertical, 8)
            }
        }
        .listStyle(SidebarListStyle())
    }
}

struct AppListView_Previews: PreviewProvider {
    @State static var selection: String? = ""
    @State static var data = [DeveloperApp(id: "1", name: "Stocket", bundleId: "com.corasan.stocket")]

    static var previews: some View {
        AppListView(selection: $selection, data: $data)
    }
}
