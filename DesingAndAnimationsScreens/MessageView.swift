//
//  MessageView.swift
//  DesingAndAnimationsScreens
//
//  Created by Matteo Buompastore on 17/05/23.
//

import SwiftUI

struct MessageView: View {
    @State var time = 0.0
    @State var showMessage = true
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body : some View {
        content
            .opacity(showMessage ? 1 : 0)
            .scaleEffect(showMessage ? 1 : 0)
            .rotationEffect(.degrees(showMessage ? 0 : 30))
            .offset(y: showMessage ? 0 : 500)
            .blur(radius: showMessage ? 0 : 20)
            .padding(10)
            .dynamicTypeSize(.xSmall ... .xLarge)
    }
    
    var content: some View {
        VStack(alignment: .center, spacing: 20) {
            Image(systemName: "timelapse", variableValue: time)
                .imageScale(.large)
                .foregroundColor(.accentColor)
                .font(.system(size: 50, weight: .thin))
                .onReceive(timer) {value in
                    withAnimation {
                        self.time += 0.1
                    }
                }
            
            Text("Switching Apps".uppercased())
                .font(.largeTitle.width(.condensed))
                .fontWeight(.bold)
            
            Text("Tap and hold any part of the screen for 1 second to show the menu for switching between apps.")
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .fontWeight(.medium)
            
            //ButtonModifiers()
            
            Button {
                withAnimation {
                    showMessage = false
                }
            } label: {
                Text("Got it")
                    .padding()
                    .frame(maxWidth: .infinity)
                //.border(Color("AccentColor"), width: 1)
                    .background(.white.opacity(0.2).gradient)
                    .cornerRadius(10)
                    .background(
                        stroke
                    )
            }
            .tint(.primary)
            .shadow(radius: 10)
        }
        .padding(30)
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .overlay(
            stroke
        )
        .shadow(color: .black.opacity(0.3), radius: 20, y: 20)
        .frame(maxWidth: 500)
    }
    
    @ViewBuilder
    func ButtonModifiers() -> some View {
        Button("Got it") {
            
        }
        .padding(.all)
        .frame(width: 300)
        .buttonStyle(.bordered)
        .controlSize(.large)
        .tint(.accentColor)
        //.border(Color("AccentColor"), width: 1)
    }
    
    var stroke : some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke()
            .foregroundStyle(.linearGradient(
                colors: [.white.opacity(0.5), .clear, .white.opacity(0.5), .clear],
                startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
            .background(Image("Wallpaper 2"))
    }
}
