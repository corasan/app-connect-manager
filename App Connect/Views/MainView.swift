//
//  MainView.swift
//  App Connect
//
//  Created by Henry Paulino on 7/9/20.
//

import SwiftUI

struct MainView: View {
    @State var selected = 0

    var body: some View {
        VStack {
            TabBar(selected: $selected)
            Spacer()
            ScrollView {
                
            }
            .background(Color.blue)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
