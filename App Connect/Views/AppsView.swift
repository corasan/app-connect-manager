//
//  AppsView.swift
//  App Connect
//
//  Created by Henry Paulino on 7/9/20.
//

import SwiftUI

struct AppsView: View {
    @EnvironmentObject var api: AppConnectAPI

    var body: some View {
        VStack {
            Text("App Store Connect")
                .font(.system(size: 50, weight: .bold))
            Text("Select an app to get started")
                .font(.system(size: 20, weight: .semibold))
                .padding(.top, 15)
                .padding(.bottom, 30)
            HStack {
                ForEach(api.apps) { app in
                    Button(action: {
                        api.selectApp(app: app)
                    }) {
                        VStack {
                            Rectangle()
                                .frame(width: 80, height: 80)
                                .cornerRadius(12)
                            Text(app.name)
                                .font(.system(size: 26, weight: .bold))

                        }
                        .padding(.vertical, 15)
                        .padding(.horizontal, 30)
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}

struct AppsView_Previews: PreviewProvider {
    static var previews: some View {
        AppsView().environmentObject(AppConnectAPI())
    }
}
