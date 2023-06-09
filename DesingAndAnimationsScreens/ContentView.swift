//
//  ContentView.swift
//  DesingAndAnimationsScreens
//
//  Created by Matteo Buompastore on 16/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var showMenu = false
    @AppStorage("selectedMenu") var selectedMenu : Menu = .compass
    @GestureState var press = false
    
    var longPress : some Gesture {
        LongPressGesture(minimumDuration: 1)
            .updating($press) { currentState, gestureState, transaction in
                gestureState = currentState
            }
            .onEnded { value in
                showMenu = true
            }
    }
    
    var body : some View {
        ZStack {
            
            Color(.systemBackground).ignoresSafeArea()
            
            switch selectedMenu {
            case .compass:
                CompassView()
            case .card:
                CardReflectionView()
            case .charts:
                DetailView()
            case .radial:
                RadialLayoutView()
            case .halfsheet:
                MenuView()
            case .gooey:
                Text("Gooey")
            case .actionbutton:
                ActionButtonView()
            }
            
        }
        .overlay(MessageView())
        .onTapGesture {} //Add this to avoid scroll not working
        .gesture(longPress)
        .sheet(isPresented: $showMenu) {
            MenuView()
                .presentationDetents([.medium, .large])
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
