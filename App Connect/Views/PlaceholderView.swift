//
//  PlaceholderView.swift
//  App Connect
//
//  Created by Henry Paulino on 7/9/20.
//

import SwiftUI

struct PlaceholderView: View {
    var body: some View {
        HStack {
            VStack {
                Text("App Store Connect")
                    .font(.system(size: 40, weight: .bold))
                Text("Select an app from the side menu")
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.top, 15)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
    }
}

struct PlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderView()
    }
}
