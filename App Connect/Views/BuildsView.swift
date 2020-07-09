//
//  BuildsView.swift
//  App Connect
//
//  Created by Henry Paulino on 7/9/20.
//

import SwiftUI

struct BuildsView: View {
    @EnvironmentObject var api: AppConnectAPI

    var body: some View {
        ScrollView {
            HStack {
                Spacer()
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Spacer()
            }
        }
        .onAppear {
            api.getAppBuilds()
        }
    }
}

struct BuildsView_Previews: PreviewProvider {
    static var previews: some View {
        BuildsView()
    }
}
