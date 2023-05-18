//
//  Data.swift
//  DesingAndAnimationsScreens
//
//  Created by Matteo Buompastore on 17/05/23.
//

import Foundation

struct NavigationItem : Identifiable, Hashable {
    
    var id = UUID()
    var title : String
    var icon : String
    var menu : Menu
    
}

var navigationItems : [NavigationItem] = [
    .init(title: "Compass App", icon: "safari", menu: .compass),
    .init(title: "3D Card", icon: "lanyardcard", menu: .card),
    .init(title: "Radial Layout", icon: "clock", menu: .radial),
    .init(title: "Gooey Action Button", icon: "plus.circle", menu: .actionbutton),
    .init(title: "Gooey Menu", icon: "drop", menu: .gooey),
    .init(title: "Charts", icon: "chart.xyaxis.line", menu: .charts),
    .init(title: "Half Sheet", icon: "rectangle.portrait.bottomhalf.filled", menu: .halfsheet),
]

enum Menu : String {
    case compass
    case card
    case charts
    case radial
    case halfsheet
    case gooey
    case actionbutton
}
