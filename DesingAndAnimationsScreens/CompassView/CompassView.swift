//
//  CompassView.swift
//  DesingAndAnimationsScreens
//
//  Created by Matteo Buompastore on 18/05/23.
//

import SwiftUI
import CoreLocationUI

struct CompassView: View {
    
    @State var location : CGPoint = .zero
    @State var isDragging = false
    @State var show = false
    @ObservedObject var locationManager = LocationManager()
    
    var drag : some Gesture {
        DragGesture()
            .onChanged { value in
                location = value.location
                isDragging = true
            }
            .onEnded { value in
                withAnimation {
                    isDragging = false
                }
            }
    }
    
    var body: some View {
        ZStack {
            background
            outerCircles
                .rotation3DEffect(.degrees(show ? 26: 0), axis: (x: 1, y: 0, z: 0))
            innerCircles
                .rotation3DEffect(.degrees(show ? 15: 0), axis: (x: 1, y: 0, z: 0))
            waypoints
                .rotationEffect(.degrees(locationManager.degrees))
                .scaleEffect(show ? 0.9 : 1)
            if !show {
                flashLight
            }
            circleLabel
                .rotation3DEffect(.degrees(show ? 10: 0), axis: (x: 1, y: 0, z: 0))
            strokes
                .rotationEffect(.degrees(locationManager.degrees))
                .rotation3DEffect(.degrees(show ? 15: 0), axis: (x: 1, y: 0, z: 0))
            light
            title
            sheet
        }
        .onTapGesture {
            withAnimation {
                show.toggle()
            }
        }
        .frame(width: UIScreen.main.bounds.width)
        .gesture(drag)
    }
    
    var sheet : some View {
        CustomSheet()
            .offset(y: show ? 340 : 1000)
    }
    
    var title : some View {
        let direction = locationManager.compassDirection(locationManager.degrees)
        return VStack {
            Text("\(String(format: "%.0f", locationManager.degrees))° \(direction)")
                .font(.largeTitle)
            Text("Potenza".uppercased())
            if let myLocation = locationManager.location {
                Text("Latitude: \(myLocation.latitude.formatted(.number.precision(.fractionLength(2)))), Longitude: \(myLocation.longitude.formatted(.number.precision(.fractionLength(2))))")
            } else {
                LocationButton {
                    locationManager.requestLocation()
                }
                .labelStyle(.iconOnly)
                .cornerRadius(20)
            }
        }
        .font(.footnote)
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        
    }
    
    
    var waypoints : some View {
        ZStack{
            Circle()
                .fill(.blue)
                .frame(width: 16)
                .offset(x: 100, y: 210)
            Circle()
                .fill(.red)
                .frame(width: 16)
                .offset(x: -120, y: -200)
            Circle()
                .fill(.green)
                .frame(width: 16)
                .offset(x: 100, y: -150)
            
        }
    }
    
    var circleLabel : some View {
        CircleLabelView().foregroundColor(.white)
    }
    
    var flashLight : some View {
        GeometryReader { proxy in
            ZStack {
                Circle()
                    .fill(.radialGradient(colors: [.white.opacity(0.15), .clear], center: .center, startRadius: 0, endRadius: 200))
                    .offset(x: location.x - proxy.size.width / 2, y: location.y - proxy.size.height / 2)
                    .opacity(isDragging ? 1 : 0)
                
                Circle()
                    .fill(.radialGradient(colors: [.white, .clear], center: .center, startRadius: 0, endRadius: 200))
                    .offset(x: location.x - proxy.size.width / 2, y: location.y - proxy.size.height / 2)
                    .opacity(isDragging ? 1 : 0)
                // MARK: Masks hidden layers visibile (only) when the View to which they're applied show up
                    .mask(
                        ZStack {
                            Circle().stroke().scaleEffect(1.2)
                            Circle().stroke().scaleEffect(1.5)
                            Circle().stroke().padding(20)
                            Circle().stroke().padding(80)
                            Circle().stroke().padding(120)
                            Circle().stroke().padding(145)
                            Circle().stroke().padding(170)
                            Group {
                                Text("Home")
                                    .offset(x: 0, y: -210)
                                    .rotationEffect(.degrees(-31))
                                
                                Text("Tent")
                                    .rotationEffect(.degrees(-31))
                                    .offset(x: 115, y: -170)
                                
                                Text("Parked Car")
                                    .rotationEffect(.degrees(150))
                                    .offset(x: 80, y: 190)
                                
                                Text("N")
                                    .rotationEffect(.degrees(-31))
                                    .offset(x: 0, y: -135)
                                
                                Text("E")
                                    .rotationEffect(.degrees(90))
                                    .offset(x: 135, y: 0)
                                
                                Text("S")
                                    .rotationEffect(.degrees(180))
                                    .offset(x: 0, y: 135)
                                
                                Text("W")
                                    .rotationEffect(.degrees(-270))
                                    .offset(x: -135, y: 0)
                            }
                            .rotationEffect(.degrees(locationManager.degrees))
                        }
                            .frame(width: 393)
                    )
            }
            .frame(width: proxy.frame(in: .global).width, height: proxy.frame(in: .global).height)
        }
    }
    
    var outerCircles : some View {
        ZStack {
            outerCircle.scaleEffect(show ? 1.5 : 1.2)
            outerCircle.scaleEffect(show ? 2 : 1.5)
        }
        .frame(width: 393)
    }
    
    var background : some View {
        RadialGradient(colors: [Color(#colorLiteral(red: 0.2970857024, green: 0.3072845936, blue: 0.4444797039, alpha: 1)), .black], center: .center, startRadius: 1, endRadius: 400)
            .ignoresSafeArea()
    }
    
    var strokes : some View {
        ZStack {
            Circle().stroke(gradient, style: StrokeStyle(lineWidth: 5, dash: [1, 1]))
            Circle().stroke(gradient, style: StrokeStyle(lineWidth: 10, dash: [1, 6]))
            Circle().stroke(gradient, style: StrokeStyle(lineWidth: 15, dash: [1, 62]))
        }
        .frame(width: 315, height: 315)
    }
    
    
    var gradient : LinearGradient {
        LinearGradient(colors: [Color(#colorLiteral(red: 0.6817082763, green: 0.6911381483, blue: 0.7610693574, alpha: 1)), .black], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
}

struct CompassView_Previews: PreviewProvider {
    static var previews: some View {
        CompassView()
    }
}
