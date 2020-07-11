//
//  SideMenu.swift
//  App Connect
//
//  Created by Henry Paulino on 7/9/20.
//

import SwiftUI

struct SideMenu: View {
    @State private var selection: String? = ""
    @State var menuLinks = ["Link 1", "Link 2", "Link 3", "Link 4"]
    @EnvironmentObject var api: AppConnectAPI

    var body: some View {
        VStack {
            Text(api.selectedAppName)
                .font(.system(size: 22, weight: .black))
                .foregroundColor(.white)
                .padding(.top, 10)
            List(selection: $selection) {
                ForEach(menuLinks, id: \.self) { el in
                    NavigationLink(destination: EmptyView()) {
                        HStack {
                            Rectangle()
                                .frame(width: 42, height: 42)
                                .cornerRadius(6)
                            Text(el)
                                .font(.system(size: 20, weight: .semibold))
                                .padding(.leading, 5)
                        }
                    }
                    .padding(.vertical, 12)
                }
            }
            .listStyle(SidebarListStyle())
            .padding(.top, 10)
            .frame(minWidth: 250, maxWidth: 300)
        }
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu().environmentObject(AppConnectAPI())
    }
}
