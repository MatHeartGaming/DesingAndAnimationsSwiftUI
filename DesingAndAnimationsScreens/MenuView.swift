//
//  MenuView.swift
//  DesingAndAnimationsScreens
//
//  Created by Matteo Buompastore on 17/05/23.
//

import SwiftUI

struct MenuView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("selectedMenu") var selectedMenu : Menu = .compass
    
    var body: some View {
        List(navigationItems) {item in
            Button {
                //Change menu
                selectedMenu = item.menu
                presentationMode.wrappedValue.dismiss()
            } label: {
                Label(item.title, systemImage: item.icon)
                    .foregroundColor(.primary)
                .padding(8)
            }
        }
        .listStyle(.plain)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
