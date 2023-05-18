//
//  CardReflectionView.swift
//  DesingAndAnimationsScreens
//
//  Created by Matteo Buompastore on 17/05/23.
//

import SwiftUI

struct CardReflectionView: View {
    
    @State var translation : CGSize = .zero
    @State var isDragging = false
    
    var drag : some Gesture {
        DragGesture()
            .onChanged { value in
                translation = value.translation
                isDragging = true
            }
            .onEnded { value in
                withAnimation {
                    translation = .zero
                    isDragging = false
                }
            }
    }
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            
            Image("Background 1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 600)
                .overlay {
                    Image("Logo 1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180)
                        .offset(x: translation.width / 8, y: translation.height / 15)
                    
                    Image("Logo 2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400)
                        .offset(x: translation.width / 10, y: translation.height / 20)
                    
                    Image("Logo 3")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 392, height: 600)
                        .blendMode(.overlay)
                        .offset(x: translation.width / 15, y: translation.height / 30)
                }
                .overlay(gloss1.blendMode(.softLight))
                .overlay(gloss2.blendMode(.luminosity))
                .overlay(gloss2.blendMode(.overlay))
                .overlay(LinearGradient(colors: [.clear, .white.opacity(0.4), .clear], startPoint: .topLeading, endPoint: .bottomTrailing))
                .overlay(RoundedRectangle(cornerRadius: 50)
                    .strokeBorder(.linearGradient(colors: [.clear, .white.opacity(0.75), .clear, .white.opacity(0.75), .clear], startPoint: .topLeading, endPoint: .bottomTrailing)))
            //.overlay(LinearGradient(colors: [Color(#colorLiteral)], startPoint: .topLeading, endPoint: .bottomTrailing)).blendMode(.overlay)
                .cornerRadius(50)
                .background(
                    RoundedRectangle(cornerRadius: 50)
                        .fill(.black)
                        .offset(y: 50)
                        .blur(radius: 50)
                        .opacity(0.5)
                        .blendMode(.overlay)
                )
                .scaleEffect(0.9)
                .rotation3DEffect(.degrees(isDragging ? 30 : 0), axis: (x: -translation.height, y: translation.width, z: 0))
                .gesture(drag)
        }
        .preferredColorScheme(.dark)
    }
    
    var gloss1 : some View {
        Image("Gloss 1")
            .resizable()
            .scaledToFill()
            .mask(LinearGradient(colors: [.clear, .white,
                                          .clear, .white, .clear, .white, .clear, .white,],
                                 startPoint: .topLeading, endPoint: UnitPoint(x: (abs(translation.height) / 100) + 1,
                                                                              y: (abs(translation.height) / 100) + 1))
                .frame(width: 392)
            )
    }
    
    var gloss2 : some View {
        Image("Gloss 2")
            .resizable()
            .scaledToFill()
            .mask(LinearGradient(colors: [.clear, .white,
                                          .clear, .white, .clear, .white, .clear, .white,],
                                 startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 392)
            )
    }
    
}

struct CardReflectionView_Previews: PreviewProvider {
    static var previews: some View {
        CardReflectionView()
    }
}
