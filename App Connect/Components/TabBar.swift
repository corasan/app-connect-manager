//
//  TabBar.swift
//  App Connect
//
//  Created by Henry Paulino on 7/9/20.
//

import SwiftUI

struct AnchorData {
    var index: Int
    var bounds: Anchor<CGRect>
}

struct TabBar: View {
    @Binding var selected: Int
    var tabs = ["Builds", "Testflight", "Activity"]
    
    private func renderTab(index: Int, label: String) -> some View {
        Button(label) {
            print("selected \(label)")
        }
        .buttonStyle(PlainButtonStyle())
        .padding(.horizontal, 55)
        .padding(.vertical, 10)
        .foregroundColor(index == self.selected ? .blue : .white)
    }

    var body: some View {
        HStack {
            ForEach(tabs.indices, id: \.self) {
                renderTab(index: $0, label: tabs[$0])
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    @State static var selected = 0
    static var previews: some View {
        TabBar(selected: $selected)
    }
}
